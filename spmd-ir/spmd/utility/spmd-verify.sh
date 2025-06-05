#!/bin/bash

# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

# This script is used to run the SPMD verification passes on the input files.
# It takes the following arguments:
# 1. verPass: The verification pass to run (e.g., check-dataRace, check-collectives).
# 2. numRanks: Optional number of ranks for the check-collectives pass.
# 3. emitSPMDIR: Optional flag to emit the SPMD directory.
# 4. emitJson: Optional flag to emit JSON output.
# 5. disableMV: Optional flag to disable multi-value analysis.
# 6. printDebugInfo: Optional flag to print debug information.
# 7. time: Optional flag to enable timing.
# 8. input files: The input files to process.
# Usage: ./spmd-verify.sh <verPass> [numRanks] [emitSPMDIR] [emitJson] [disableMV] [printDebugInfo] [time] <input files>
# Example: ./spmd-verify.sh check-dataRace emitSPMDIR file1.cpp file2.cu

verPass=$1

# Defaults
emitSPMDIR=false
emitJson=false
optLevel=O1
numRanks=0

shift

# Parse numRanks if applicable
if [[ "$verPass" == "check-collectives" && "$1" =~ ^[0-9]+$ ]]; then
  numRanks=$1
  shift
fi

# Optional flags
if [[ $1 == "emitSPMDIR" ]]; then
  emitSPMDIR=true
  shift
fi

if [[ $1 == "emitJson" ]]; then
  emitJson=true
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

# Add emitJson as pass option
emitJsonFlag=""
if [ "$emitJson" == true ]; then
  emitJsonFlag="write-json-report"
fi

# Compose verPass string
if [[ "$verPass" == "check-dataRace" ]]; then
  verPass="-check-dataRace"
  if [ "$emitJson" == true ]; then
    verPass="-check-dataRace=$emitJsonFlag"
  fi
elif [[ "$verPass" == "check-collectives" ]]; then
  verPass="-check-collectives"
  options="num-ranks=$numRanks"
    if [ "$emitJson" == true ]; then
    options+=" $emitJsonFlag"
  fi
  verPass+="=$options"          # close the quote
  additionalCollectivesPass="-convert-scf-switch-to-if"
  optLevel=O0
else
  echo "Invalid input for verPass. Please set it to either 'check-dataRace' or 'check-collectives'."
  exit 1
fi

# Collect input files
inputFiles=""
for arg in "$@"; do
  if [[ "$arg" != -* ]]; then
    inputFile=$(realpath "$arg")
    inputFiles+="$inputFile "
    if [[ -z "$inputDir" ]]; then
      inputDir="$(dirname "$arg")"
      file=$(basename "$inputFile")
      filename="${file%.*}"         # strip extension like .cpp/.cu
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

# Choose compiler depending on input file extension
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

# Source type flags
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

# Compile and run passes
CPATH="$CPATH" $clang $clangFlags "$@" \
| $spmdOpt -prepare-llvm-func-inline -inline -cse -mem2reg -canonicalize \
  -inline-gpu-launch-funcs -delete-inlined-funcs -handle-llvm-unreachable -canonicalize \
  -lift-cf-to-scf -canonicalize -promote-scf-while -canonicalize \
  -convert-apiCalls-to-spmd $additionalCollectivesPass -simplify-cmp-ops $MVPASS "$verPass" \
  $PRINTDEBUGINFO $time -o "$outputFile"
