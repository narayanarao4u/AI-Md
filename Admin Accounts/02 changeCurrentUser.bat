@echo off
setlocal enabledelayedexpansion

:: Get the current username
for /f "tokens=2" %%i in ('whoami ^| findstr /i /r /c:"User Name\s\+: \S\+"') do set "username=%%i"

:: Check if the user is an administrator
net user "%username%" | findstr /i /c:"Local Group Memberships" | findstr /i /c:"Administrators" >nul
if %errorlevel% neq 0 (
    echo The current user is not an administrator.
    goto :eof
)

:: Remove the user from the Administrators group
net localgroup Administrators "%username%" /delete
if %errorlevel% neq 0 (
    echo Failed to remove user from Administrators group.
    goto :eof
)

:: Add the user to the Users group
net localgroup Users "%username%" /add
if %errorlevel% neq 0 (
    echo Failed to add user to Users group.
    goto :eof
)

echo User has been changed from Administrator to Standard.

endlocal