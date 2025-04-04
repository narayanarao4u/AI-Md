@echo off
setlocal enabledelayedexpansion

:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator.
    pause
    exit /b 1
)

:: Define the new user details
set "username=ITAdmin"
set "password=Itvm#321"

:: Check if the user already exists
net user "%username%" | find /i "%username%" >nul
if %errorlevel% equ 0 (
    echo User %username% already exists.
    goto :eof
)

:: Create the new user
net user "%username%" "%password%" /add
net user  "%username%" /passwordexpires:no
if %errorlevel% neq 0 (
    echo Failed to create user %username%.
    goto :eof
)

:: Add the new user to the Administrators group
net localgroup Administrators "%username%" /add
if %errorlevel% neq 0 (
    echo Failed to add %username% to the Administrators group.
    goto :eof
)

:: Set the password to never expire (optional)
wmic useraccount where "Name='%username%'" set PasswordExpires=FALSE

echo User %username% has been created and added to the Administrators group with password .

endlocal