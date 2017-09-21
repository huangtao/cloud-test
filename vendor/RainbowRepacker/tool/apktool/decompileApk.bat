echo мохКapk╟Э
REM echo "%~f1"
REM echo "%~dp0"
REM echo %0
pushd %~dp0 
./apktool.bat d -f "%~f1" ./decompile
popd
pause