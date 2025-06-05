configure_file("${CMAKE_CURRENT_SOURCE_DIR}/spmd-verify.sh" 
    "${CMAKE_BINARY_DIR}/bin/spmd-verify" @ONLY)
install(FILES "${CMAKE_BINARY_DIR}/bin/spmd-verify"
        DESTINATION bin
        PERMISSIONS
        OWNER_READ OWNER_WRITE OWNER_EXECUTE
        GROUP_READ GROUP_EXECUTE
        WORLD_READ WORLD_EXECUTE)
