
Certainly! You can modify the script to prompt the user for the desired drive letter. Here’s how you can do that:

### Modified Script

1. **Open Notepad**: Press `Win + R`, type `notepad`, and hit Enter.

2. **Copy and Paste the Modified Script**:

    ```batch
    @echo off
    setlocal

    rem Prompt for the drive letter
    set /p drive="Enter the drive letter to move folders (e.g., D): "

    rem Set your new paths
    set targetPath=%drive%:\Users\%USERNAME%

    rem Create target directories if they don't exist
    mkdir "%targetPath%\Desktop" "%targetPath%\Documents" "%targetPath%\Downloads"

    rem Move the existing folders to the new location
    move "%USERPROFILE%\Desktop" "%targetPath%\Desktop"
    move "%USERPROFILE%\Documents" "%targetPath%\Documents"
    move "%USERPROFILE%\Downloads" "%targetPath%\Downloads"

    rem Create symbolic links to the new locations
    mklink /D "%USERPROFILE%\Desktop" "%targetPath%\Desktop"
    mklink /D "%USERPROFILE%\Documents" "%targetPath%\Documents"
    mklink /D "%USERPROFILE%\Downloads" "%targetPath%\Downloads"

    echo Folders moved successfully to %targetPath%!
    pause
    ```

3. **Save the File**:
   - Click on `File` > `Save As`.
   - Change the "Save as type" to "All Files".
   - Name it `MoveFoldersPrompt.bat` and save it to a location you can easily find.

4. **Run the Script**:
   - Right-click on `MoveFoldersPrompt.bat` and select `Run as administrator`.
   - Enter the desired drive letter when prompted.

### Important Notes
- **Ensure Valid Drive**: The script doesn't check if the drive exists, so make sure to enter a valid drive letter.
- **Admin Privileges**: The script still requires administrative privileges to run properly.
- **Backup Data**: Always back up important data before executing the script.

This way, you can easily specify the drive you want to use for moving your folders!