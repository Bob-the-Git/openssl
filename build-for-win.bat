call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

@echo on

set OPENSSL_ROOT_DIR=%~dp0

cd /d %OPENSSL_ROOT_DIR%
mkdir out\build\Debug-Windows-x64
cd out\build\Debug-Windows-x64
perl %OPENSSL_ROOT_DIR%/Configure VC-WIN64A -static --prefix=%OPENSSL_ROOT_DIR%/out/install/Debug-Windows-x64 --openssldir=%OPENSSL_ROOT_DIR%/out/install/Debug-Windows-x64/data --debug >> build.log.txt 2>&1
nmake >> build.log.txt 2>&1
nmake test >> build.log.txt 2>&1
nmake install >> build.log.txt 2>&1

cd /d %OPENSSL_ROOT_DIR%
mkdir out\build\Release-Windows-x64
cd out\build\Release-Windows-x64
perl %OPENSSL_ROOT_DIR%/Configure VC-WIN64A -static --prefix=%OPENSSL_ROOT_DIR%/out/install/Release-Windows-x64 --openssldir=%OPENSSL_ROOT_DIR%/out/install/Release-Windows-x64/data --release >> build.log.txt 2>&1
nmake >> build.log.txt 2>&1
nmake test >> build.log.txt 2>&1
nmake install >> build.log.txt 2>&1
