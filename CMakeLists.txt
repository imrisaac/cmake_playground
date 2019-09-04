
cmake_minimum_required(VERSION 3.7.0)
project(Main)

set(_target Main)
add_executable(${_target} src/main.c)

# for generated gitversion.h
target_include_directories(${_target} PRIVATE ${CMAKE_BINARY_DIR})

# Versioning 
add_custom_target(PRE_BUILD_VERSIONING
  COMMAND ${CMAKE_COMMAND}
    -Dtop_dir="${CMAKE_CURRENT_SOURCE_DIR}"               # top of source repo, where CMakeLists is
    -Dbuild_dir="${CMAKE_CURRENT_BINARY_DIR}"             # this is the build directory
    -P "${CMAKE_CURRENT_SOURCE_DIR}/version.cmake"
)

# Ensure versioning is always done first 
add_dependencies(${_target} PRE_BUILD_VERSIONING)


