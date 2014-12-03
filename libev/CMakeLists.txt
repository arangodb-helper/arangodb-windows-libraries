# -*- mode: CMAKE; -*-

## -----------------------------------------------------------------------------
## --SECTION--                                                    COMMON DEFINES
## -----------------------------------------------------------------------------

cmake_minimum_required(VERSION 2.6)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE string "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif ()

################################################################################
### @brief libev library
################################################################################

project(libev)

set(LIB_LIBEV ev)

include_directories(libev-4.11)

if (MSVC)
  foreach (flag_var
	   CMAKE_C_FLAGS
	   CMAKE_C_FLAGS_DEBUG
	   CMAKE_C_FLAGS_RELEASE
	   CMAKE_C_FLAGS_MINSIZEREL
	   CMAKE_C_FLAGS_RELWITHDEBINFO
	   CMAKE_CXX_FLAGS
	   CMAKE_CXX_FLAGS_DEBUG
	   CMAKE_CXX_FLAGS_RELEASE
	   CMAKE_CXX_FLAGS_MINSIZEREL
	   CMAKE_CXX_FLAGS_RELWITHDEBINFO)
    if (${flag_var} MATCHES "/MD")
      string(REGEX REPLACE "/MDd?" "" ${flag_var} "${${flag_var}}")
    endif ()

    if (flag_var MATCHES "DEBUG")
      set(${flag_var} "${${flag_var}} /MTd")
    else ()
      set(${flag_var} "${${flag_var}} /MT")
    endif ()

    message(STATUS "${flag_var}=${${flag_var}}")
  endforeach ()
endif ()

## -----------------------------------------------------------------------------
## --SECTION--                                                         LIBRARIES
## -----------------------------------------------------------------------------

################################################################################
### @brief LIB_LIBEV
################################################################################

add_definitions("-D_CRT_SECURE_NO_WARNINGS=1")
add_definitions("-DFD_SETSIZE=2048")

add_library(
    ${LIB_LIBEV}
    STATIC
    libev-4.11/evwrap.c
)

## -----------------------------------------------------------------------------
## --SECTION--                                                       END-OF-FILE
## -----------------------------------------------------------------------------

## Local Variables:
## mode: outline-minor
## outline-libevp: "^\\(### @brief\\|## --SECTION--\\|# -\\*- \\)"
## End:
