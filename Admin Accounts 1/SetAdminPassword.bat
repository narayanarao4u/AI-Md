@echo off
setlocal

REM Get the current username
for /F "tokens=*" %%i in ('whoami') do set "username=%%i"

REM Set password for the current user
net user %username% Vizagit@123

echo Password for %username% has been set to Vizagit@123.
pause
