message(STATUS "Resolving GIT Version")

set(_commit_hash "unknown")

# Build number incrementing
set(_release_version 0)
set(_major_version 1)
set(_minor_version 1)
set(_build_number 12)

#MATH(EXPR _build_number "${_build_number}+1")

find_package(Git)

if(GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
    WORKING_DIRECTORY "${local_dir}"
    OUTPUT_VARIABLE _commit_hash
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  message( STATUS "GIT hash: ${_commit_hash}")
else()
  message(STATUS "GIT not found")
endif()

string(TIMESTAMP _time_stamp)

configure_file(${top_dir}/src/version.h.in ${build_dir}/version.h @ONLY)

# file(STRINGS ${top_dir}/src/version.h.in BIG_VAR)

# message(STATUS ${BIG_VAR})

# string(FIND "${BIG_VAR}" "THISBUILD" THIS_BUILD_START)

# message(STATUS "Position of build string is ${THIS_BUILD_START}")
