@echo off
setlocal

REM Get the current username
for /F "tokens=*" %%i in ('whoami /user /fo list ^| findstr /B "User Name"') do set "username=%%i"
set "username=%username:User Name= %"

REM Remove the current user from the Administrators group
net localgroup Administrators %username% /delete

echo %username% has been changed to a standard user.
pause
