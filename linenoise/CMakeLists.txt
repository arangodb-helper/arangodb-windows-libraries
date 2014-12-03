# -*- mode: CMAKE; -*-

## -----------------------------------------------------------------------------
## --SECTION--                                                    COMMON DEFINES
## -----------------------------------------------------------------------------

cmake_minimum_required(VERSION 2.6)

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE string "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif ()

################################################################################
### @brief linenoise library
################################################################################

project(linenoise)

set(LIB_GETOPT linenoise)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /DUSE_UTF8 /DUNICODE")
message(STATUS "CMAKE_C_FLAGS=${CMAKE_C_FLAGS}")
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
### @brief LIB_GETOPT
################################################################################

add_definitions("-D_CRT_SECURE_NO_WARNINGS=1")

add_library(
    ${LIB_GETOPT}
    STATIC
    linenoise/linenoise.c
    linenoise/utf8.c
)

add_executable(linenoise-example
               linenoise/example.c
               )
target_link_libraries(linenoise-example  linenoise)
               

## -----------------------------------------------------------------------------
## --SECTION--                                                       END-OF-FILE
## -----------------------------------------------------------------------------

## Local Variables:
## mode: outline-minor
## outline-regexp: "^\\(### @brief\\|## --SECTION--\\|# -\\*- \\)"
## End:
