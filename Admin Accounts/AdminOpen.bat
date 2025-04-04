@echo off
setlocal
set USERNAME=ITAdmin
set PASSWORD=Itvm#321
set EXECUTABLE=trinetra-agent-proxy-sz-final.exe

echo %PASSWORD%| runas /user:%USERNAME% "%EXECUTABLE%"
endlocal
