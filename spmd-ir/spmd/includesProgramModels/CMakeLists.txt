# SPDX-FileCopyrightText: 2025 Semih Burak, RWTH Aachen University
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

file(COPY "${CMAKE_CURRENT_SOURCE_DIR}" DESTINATION ${CMAKE_BINARY_DIR})
install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    DESTINATION ${CMAKE_INSTALL_PREFIX})

