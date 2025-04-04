
---
 standard user should not have access to local Users and Groups in computer management
---
To ensure that a standard user does not have access to the Local Users and Groups in Computer Management, you need to adjust the permissions and possibly use Group Policy to limit access. A standard user should not have the ability to access or modify local user accounts by default. However, administrative access to such settings can sometimes still be available unless specifically restricted.

Here’s a step-by-step approach to ensure that the new standard user does not have access to Local Users and Groups:

### 1. **Verify User Privileges**
Ensure that the user is indeed in the "Standard User" group and not an administrator. This is crucial because administrative users have access to all system settings, including Local Users and Groups.

### 2. **Adjust User Permissions**
By default, a standard user should not have access to manage users. However, if you need to ensure stricter controls or if additional configuration is needed, follow these steps:

#### **Using Group Policy Editor**

1. **Open Group Policy Editor**:
   - Press `Win + R`, type `gpedit.msc`, and press Enter.

2. **Navigate to the User Rights Assignment**:
   - Go to `Computer Configuration` > `Windows Settings` > `Security Settings` > `Local Policies` > `User Rights Assignment`.

3. **Restrict Access to Management Tools**:
   - Look for the policy named **"Access this computer from the network"** and **"Deny log on locally"**. Ensure that your standard users are not listed here.

4. **Hide Local Users and Groups Snap-In** (Advanced):
   - Go to `User Configuration` > `Administrative Templates` > `Control Panel` > `Hide specified Control Panel items`.
   - Enable this policy and specify `lusrmgr.msc` to prevent access to the Local Users and Groups snap-in in Control Panel.

#### **Using Security Settings**

1. **Open Computer Management**:
   - Press `Win + X` and select `Computer Management`.

2. **Navigate to Local Users and Groups**:
   - Expand `Local Users and Groups` > `Users`.

3. **Adjust User Permissions**:
   - Right-click on the user account and choose `Properties`.
   - Ensure that the user is not part of any groups that would grant administrative rights.

4. **Verify Group Membership**:
   - Ensure the user is not part of the `Administrators` or `Power Users` group.

### Example Batch File to Change User Privileges

Here’s an updated batch file that ensures the user `ITAdmin` is created as an administrator, and then the current user is demoted to a standard user. This script does not directly handle access control for Local Users and Groups but ensures the privilege change.

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

### Final Steps

1. **Log Off**: After running the script, log off and log back in to apply changes.
2. **Test Access**: Verify that the new standard user does not have access to Local Users and Groups.

By ensuring that standard users are not part of the Administrators group and configuring policies appropriately, you can effectively restrict access to sensitive system settings.