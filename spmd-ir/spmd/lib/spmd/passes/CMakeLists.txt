# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

add_mlir_dialect_library(MLIRSPMDTransforms
        ConvertApiCallsToSPMD.cpp
        CheckDataRace.cpp
        MultiValueAnalysis.cpp
        CheckCollectives.cpp
        ConvertLLVMToFunc.cpp
        PrepareLLVMFuncInline.cpp
        HandleLLVMUnreachable.cpp
        DeleteInlinedFuncs.cpp
        ConvertSCFSwitchToIf.cpp
        ConvertArithSelectToIf.cpp
        SimplifyCmpOps.cpp
        InlineGPULaunchFuncs.cpp
        common.cpp

        DEPENDS
        MLIRSPMDOpsIncGen
        # MLIRSPMDAttributesIncGen
        MLIRSPMDPassesIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        MLIRInferTypeOpInterface
        MLIRFuncDialect
        MLIRSPMDUtils
        MLIRSPMDAnalysis
)
add_subdirectory(CACTS)