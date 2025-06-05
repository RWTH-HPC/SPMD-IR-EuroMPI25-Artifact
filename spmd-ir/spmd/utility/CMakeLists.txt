# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/spmd-verify.sh" 
    "${CMAKE_BINARY_DIR}/bin/spmd-verify" @ONLY)
install(FILES "${CMAKE_BINARY_DIR}/bin/spmd-verify"
        DESTINATION bin
        PERMISSIONS
        OWNER_READ OWNER_WRITE OWNER_EXECUTE
        GROUP_READ GROUP_EXECUTE
        WORLD_READ WORLD_EXECUTE)
