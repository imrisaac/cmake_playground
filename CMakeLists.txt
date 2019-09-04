
cmake_minimum_required(VERSION 3.7.0)
project(Main)

set(_target Main)
add_executable(${_target} src/main.c)

# get git commit hash, this always runs no matter the build state
add_custom_command(TARGET ${_target}
  PRE_BUILD
  COMMAND ${CMAKE_COMMAND}
    -Dtop_dir="${CMAKE_CURRENT_SOURCE_DIR}"               # top of source repo, where CMakeLists is
    -Dbuild_dir="${CMAKE_CURRENT_BINARY_DIR}"             # this is the build directory
    -P "${CMAKE_CURRENT_SOURCE_DIR}/gitversion.cmake"
)

# for generated gitversion.h
target_include_directories(${_target} PRIVATE ${CMAKE_BINARY_DIR})

execute_process(
        COMMAND
            git rev-parse --short HEAD
        RESULT_VARIABLE
            SHORT_HASH_RESULT
        OUTPUT_VARIABLE
            SHORT_HASH)

message(${SHORT_HASH_RESULT})
message(${SHORT_HASH})
message(${CMAKE_CURRENT_SOURCE_DIR})



