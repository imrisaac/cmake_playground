message(STATUS "Resolving GIT Version")

set(_commit_hash "unknown")

# Build number incrementing
set(_version_release 0)
set(_version_major 1)
set(_version_minor 1)
set(_version_patch 12)

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

file(READ ${top_dir}/src/version.h.in ver)

string(REGEX MATCH "VERSION_RELEASE ([0-9]*)" _ ${ver})
set(ver_release ${CMAKE_MATCH_1})

string(REGEX MATCH "VERSION_MAJOR ([0-9]*)" _ ${ver})
set(ver_major ${CMAKE_MATCH_1})

string(REGEX MATCH "VERSION_MINOR ([0-9]*)" _ ${ver})
set(ver_minor ${CMAKE_MATCH_1})

string(REGEX MATCH "VERSION_PATCH ([0-9]*)" _ ${ver})
set(ver_patch ${CMAKE_MATCH_1})

# increment the build number
MATH(EXPR ver_patch "${ver_patch}+1")

message("This version: ${ver_release}.${ver_major}.${ver_minor}.${ver_patch}")