@echo off
setlocal

REM Prompt for the username
set /p "username=Enter the new username: "

REM Create a new standard user with password bsnl123
net user %username% bsnl123 /add
net localgroup "Users" %username% /add

echo User %username% has been created with the password 'bsnl123'.
pause
