# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
        ${dialect_libs}
        ${conversion_libs}

        MLIROptLib
        MLIRFuncInlinerExtension
        # MLIRPolygeist
        # MLIRSPMD        

        # MLIRArithDialect
        # MLIRIR
        # MLIRAnalysis
        # MLIRLLVMDialect      
        )
add_llvm_executable(spmd-opt spmd-opt.cpp)

llvm_update_compile_flags(spmd-opt)
target_link_libraries(spmd-opt PRIVATE ${LIBS})
install(TARGETS spmd-opt DESTINATION bin)

mlir_check_all_link_libraries(spmd-opt)