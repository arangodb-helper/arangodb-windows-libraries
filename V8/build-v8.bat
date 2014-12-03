:: ========================================================================================================
:: ==== <CONFIGURATION>
:: ========================================================================================================

:: Set the version of Visual Studio. This will just add a suffix to the string
:: of your directories to avoid mixing them up.
SET VS_VERSION=vs2013

:: Set this to the directory that contains vcvarsall.bat file of the
:: VC Visual Studio version you want to use for building ICU.
SET VISUAL_STUDIO_VC="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC"

:: Set this to the version of ICU you are building
SET V8_VERSION=3.16.14

:: ========================================================================================================
:: ==== <BUILD> 64bit
:: ========================================================================================================

call %VISUAL_STUDIO_VC%\vcvarsall.bat x86_amd64

set CMD=-G msvs_version=2013
set CMD=%CMD% -Dtarget_arch=x64
set CMD=%CMD% -Dcomponent=static
set CMD=%CMD% -Dmode=release
set CMD=%CMD% -Dlibrary=static_library
set CMD=%CMD% -Dmsvcrt=static
set CMD=%CMD% -Dsnapshot=no

echo %CMD%

cd V8-%V8_VERSION%

del /f /q "build\all.sln"
del /f /q "build\all.vcxproj"
del /f /q "build\all.sdf"
del /f /q "build\all.suo"

third_party\python_26\python build\gyp_v8 %CMD%

cd build

rmdir /S /Q Debug
rmdir /S /Q Debug64
msbuild All.sln /t:v8 /p:Configuration=Debug /p:Platform=x64
ren Debug Debug64

rmdir /S /Q Release
rmdir /S /Q Release64
msbuild All.sln /t:v8 /p:Configuration=Release /p:Platform=x64"
ren Release Release64

cd ..
cd ..

:: ========================================================================================================
:: ==== <BUILD> 32bit
:: ========================================================================================================

call %VISUAL_STUDIO_VC%\vcvarsall.bat x86

set CMD=-G msvs_version=2013
set CMD=%CMD% -Dtarget_arch=ia32
set CMD=%CMD% -Dcomponent=static
set CMD=%CMD% -Dmode=release
set CMD=%CMD% -Dlibrary=static_library
set CMD=%CMD% -Dmsvcrt=static
set CMD=%CMD% -Dsnapshot=no

echo %CMD%

cd V8-%V8_VERSION%

del /f /q "build\all.sln"
del /f /q "build\all.vcxproj"
del /f /q "build\all.sdf"
del /f /q "build\all.suo"

third_party\python_26\python build\gyp_v8 %CMD%

cd build

rmdir /S /Q Debug
rmdir /S /Q Debug32
msbuild All.sln /t:v8 /p:Configuration=Debug /p:Platform=Win32
ren Debug Debug32

rmdir /S /Q Release
rmdir /S /Q Release32
msbuild All.sln /t:v8 /p:Configuration=Release /p:Platform=Win32
ren Release Release32

exit
