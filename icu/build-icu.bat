:: ========================================================================================================
:: ==== <CONFIGURATION>
:: ========================================================================================================

:: Set the version of Visual Studio. This will just add a suffix to the string
:: of your directories to avoid mixing them up.
SET VS_VERSION=vs2013

:: Set this to the directory that contains vcvarsall.bat file of the
:: VC Visual Studio version you want to use for building ICU.
SET VISUAL_STUDIO_VC="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC"

:: Set this to the name of the project
SET BUILD_PROJECT=icu

:: Set this to the version of ICU you are building
SET ICU_VERSION=52.1

:: ========================================================================================================
:: ==== <BUILD>
:: ========================================================================================================

call %VISUAL_STUDIO_VC%\vcvarsall.bat x86_amd64
set BUILD_BITS=64
bash compile-icu

call %VISUAL_STUDIO_VC%\vcvarsall.bat x86
set BUILD_BITS=32
bash compile-icu

exit
