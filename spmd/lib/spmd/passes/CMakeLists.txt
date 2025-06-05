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