#!/bin/bash

# This script is used to run the SPMD verification passes on the input files.
# It takes the following arguments:
# 1. verPass: The verification pass to run (e.g., check-dataRace, check-collectives).
# 2. numRanks: Optional number of ranks for the check-collectives pass.
# 3. emitSPMDIR: Optional flag to emit the SPMD directory.
# 4. disableMV: Optional flag to disable multi-value analysis.
# 5. printDebugInfo: Optional flag to print debug information.
# 6. time: Optional flag to enable timing.
# 7. input files: The input files to process.
# Usage: ./spmd-verify.sh <verPass> [numRanks] [emitSPMDIR] [disableMV] [printDebugInfo] [time] <input files>
# Example: ./spmd-verify.sh check-dataRace -emitSPMDIR file1.cpp file2.cu

verPass=$1

# Defaults
emitSPMDIR=false
optLevel=O1
numRanks=0

# Validate verPass
if [[ "$verPass" == "check-dataRace" ]]; then
  # Do nothing
  :
elif [[ "$verPass" == "check-collectives" ]]; then
  # Set verPass with num-ranks
  if [[ "$2" =~ ^[0-9]+$ ]]; then
    numRanks=$2
    shift
  fi
  verPass="check-collectives=num-ranks=$numRanks"
  additionalCollectivesPass="-convert-scf-switch-to-if"
  optLevel=O0
else
  # Exit and prompt the user for correct input
  echo "Invalid input for verPass. Please set it to either 'check-dataRace' or 'check-collectives'."
  exit 1
fi
shift

if [[ $1 == "emitSPMDIR" ]]; then
  emitSPMDIR=true
  shift
fi

if [[ $1 == "time" ]]; then
  time=-mlir-timing
  shift
fi

MVPASS=-multi-value-analysis
if [[ $1 == "disableMV" ]]; then
  MVPASS=
  shift
fi

if [[ $1 == "printDebugInfo" ]]; then
  PRINTDEBUGINFO=-mlir-print-debuginfo
  shift
fi

inputFiles=""
for arg in "$@"; do
  if [[ "$arg" != -* ]]; then
    inputFile=$(realpath "$arg")
    inputFiles+="$inputFile "
    if [[ -z "$inputDir" ]]; then
      inputDir="$(dirname "$arg")"
      file=$(basename "$inputFile")
      filename="${file%.*}"         # e.g. strip .cpp/.cu
    fi
  fi
done

if [[ -z "$inputDir" ]]; then
  echo "Error: No valid input file provided." >&2
  exit 1
fi

mlirOutput="${inputDir}/${filename}.mlir"
tmpFile=$(mktemp --suffix=.mlir)
outputFile="$tmpFile"

if [ "$emitSPMDIR" == true ]; then
  outputFile="$mlirOutput"
fi

: "${CLANG_BIN_DIR:=$(which clang | xargs dirname | xargs realpath | head -n 1)}"

# Choose compiler
if echo "$inputFile" | grep -qE "\.cpp$|\.cu$"; then
  clang=${CLANG_BIN_DIR}/clang++
else
  clang=${CLANG_BIN_DIR}/clang
fi

opt=${CLANG_BIN_DIR}/opt

SCRIPT_PATH=$(dirname "$(realpath -s "$0")")
: "${PROG_MODEL_INCLUDES:=$SCRIPT_PATH/../includesProgramModels}"
for progModel in mpi nccl shmem mynvshmem; do
  CPATH=$CPATH:${PROG_MODEL_INCLUDES}/${progModel}/include
done

# Source type
if echo "$inputFile" | grep -qE "\.cu$"; then
  S="-c --cuda-gpu-arch=sm_89"
else
  S="-S"
fi

#-fdebug-compilation-dir=$inputFile -fdebug-compilation-dir=$inputDir  -fdebug-prefix-map=$pwd=../$relativePath
clangFlags="-o - -$optLevel $S -g -fno-exceptions -mllvm --emit-mlir -mllvm --transformer-enable \
-mllvm --transformer-pre-merge-mlir-pipeline="canonicalize,convert-llvm-to-cf,convert-llvm-to-arith,canonicalize" \
-mllvm --transformer-post-merge-mlir-pipeline="convert-llvm-to-arith,canonicalize""

spmdOpt=${CLANG_BIN_DIR}/spmd-opt
# mlirOpt=${CLANG_BIN_DIR}/mlir-opt

# Compile and run passes
CPATH="$CPATH" $clang $clangFlags "$@" \
| $spmdOpt -prepare-llvm-func-inline -inline -cse -mem2reg -canonicalize \
  -inline-gpu-launch-funcs -delete-inlined-funcs -handle-llvm-unreachable -canonicalize \
  -lift-cf-to-scf -canonicalize -promote-scf-while -canonicalize \
  -convert-apiCalls-to-spmd $additionalCollectivesPass -simplify-cmp-ops $MVPASS -$verPass \
  $PRINTDEBUGINFO $time -o "$outputFile"
