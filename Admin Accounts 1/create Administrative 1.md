
---
create batch file for windows to create Administrative user with name ITAdmin and Password Vizagit@123 and change current user to standard user. 
---
Creating a batch file to manage user accounts in Windows, especially for tasks like creating an administrative user and changing the current user's privileges, involves several steps and requires careful handling of system security. Here’s a basic outline of what you need to do:

1. **Create a New Administrative User**
2. **Change the Current User to a Standard User**

### Important Note:
- **Administrative Privileges Required**: You must run the batch file as an administrator for these actions to work.
- **Security Considerations**: Storing passwords in plain text files or scripts can be a security risk. Ensure this script is used in a secure environment.

### Batch File Script

```batch
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
net user ITAdmin Vizagit@123 /add
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
```

### Explanation:
1. **Check for Administrative Privileges**: The script first checks if it’s running with administrative privileges. If not, it exits.
2. **Create New User**: It creates a new user `ITAdmin` with the password `Vizagit@123`.
3. **Add User to Administrators Group**: The new user is added to the Administrators group.
4. **Change Current User to Standard**: It removes the current user from the Administrators group, changing their privileges to standard.
5. **Log Off**: The script suggests logging off to ensure changes take effect.

### Running the Script
- Save the script as `change_user.bat`.
- Right-click the `.bat` file and choose “Run as administrator” to execute it.

Always ensure you test such scripts in a controlled environment before deploying them in a production setting.