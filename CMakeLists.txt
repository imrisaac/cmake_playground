
cmake_minimum_required(VERSION 3.7.0)
project(Main)

set(_target Main)
add_executable(${_target} src/main.c)

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



