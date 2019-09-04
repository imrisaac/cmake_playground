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
