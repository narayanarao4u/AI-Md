@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: Define the username to exclude from the changes
SET excludeUser=ITAdmin

:: Remove users from the Administrators group except ITAdmin
for /f "tokens=*" %%a in ('net localgroup Administrators') do (
    set "user=%%a"
    call :check_and_remove_admin
)

:: Set password for all users except ITAdmin
for /f "tokens=1" %%b in ('net user') do (
    set "user=%%b"
    call :check_and_set_password
)

echo Script completed.
ENDLOCAL
pause
exit /b

:check_and_remove_admin
:: Skip blank lines or the header/footer lines
if "!user!"=="" goto :eof
:: Exclude the header line or any non-user entries
echo !user! | findstr /i /v "%excludeUser%" >nul
if !errorlevel! neq 0 goto :eof
echo Removing !user! from Administrators group...
net localgroup Administrators "!user!" /delete
goto :eof

:check_and_set_password
:: Skip blank lines or the header/footer lines
if "!user!"=="" goto :eof
:: Exclude the header line or any non-user entries
echo !user! | findstr /i /v "%excludeUser%" >nul
if !errorlevel! neq 0 goto :eof
echo Setting password for !user!...
net user "!user!" bsnlvm@123
goto :eof
