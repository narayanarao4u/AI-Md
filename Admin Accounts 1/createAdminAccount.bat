@echo off
REM Ensure the script is run as administrator
:: Check if the script is running with administrative privileges
openfiles >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo This script requires administrative privileges.
    pause
    exit /b
)

REM Create the new administrative user

if %errorlevel% NEQ 0 (
    echo Failed to create user ITAdmin.
    pause
    exit /b
)

REM Add the new user to the Administrators group
net localgroup Administrators ITAdmin /add
if %errorlevel% NEQ 0 (
    echo Failed to add ITAdmin to the Administrators group.
    pause
    exit /b
)

REM Change the current user to a standard user
REM Note: The current user’s context will be terminated if they are a member of the Administrators group.

:: Get the username of the currently logged-in user
for /f "tokens=2" %%a in ('whoami') do set CURRENT_USER=%%a

REM Remove the current user from the Administrators group
net localgroup Administrators %CURRENT_USER% /delete
if %errorlevel% NEQ 0 (
    echo Failed to remove %CURRENT_USER% from the Administrators group.
    pause
    exit /b
)

REM Log off to apply the changes (recommended to avoid further issues)
echo Please log off and log back in to see the changes.
pause