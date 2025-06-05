add_mlir_dialect_library(MLIRSPMDCACTS
        mpiTransformations.cpp
        shmemTransformations.cpp
        nvshmemTransformations.cpp
        ncclTransformations.cpp
        cudaTransformations.cpp
        utils.cpp
        )
