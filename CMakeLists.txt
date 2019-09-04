
cmake_minimum_required(VERSION 3.7.0)
project(Main)

set(_target Main)
add_executable(${_target} src/main.c)

message(STATUS "Resolving GIT Version")

set(_build_version "unknown")

find_package(Git)

if(GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
    WORKING_DIRECTORY "${local_dir}"
    OUTPUT_VARIABLE _build_version
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  message( STATUS "GIT hash: ${_build_version}")
else()
  message(STATUS "GIT not found")
endif()

string(TIMESTAMP _time_stamp)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/gitversion.h.in ${CMAKE_CURRENT_BINARY_DIR}/gitversion.h @ONLY)


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



