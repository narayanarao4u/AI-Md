To check if a Windows PC was properly shut down, you can use **Event Viewer**, **Command Prompt**, or **PowerShell**. Here’s how:

### **Method 1: Using Event Viewer**
1. Press **Win + R**, type `eventvwr.msc`, and press **Enter**.
2. Navigate to:
   ```
   Windows Logs > System
   ```
3. Click **Filter Current Log** (on the right panel).
4. Set **Event ID**:
   - **6006** → Indicates a proper shutdown.
   - **6008** → Indicates an improper shutdown (e.g., power failure or forced restart).
   - **41** → Indicates an unexpected shutdown or restart.
5. Click **OK** to apply the filter.
6. Check the latest events for shutdown details.

---

### **Method 2: Using Command Prompt**
Run the following command to check shutdown history:
```sh
wevtutil qe System /q:"*[System[(EventID=6006)]]" /c:5 /f:text /rd:true
```
This lists the last five proper shutdowns.

To check unexpected shutdowns, use:
```sh
wevtutil qe System /q:"*[System[(EventID=6008)]]" /c:5 /f:text /rd:true
```

---

### **Method 3: Using PowerShell**
To find the last shutdown time:
```powershell
Get-EventLog -LogName System | Where-Object {$_.EventID -eq 6006} | Select-Object -First 1
```
For improper shutdowns:
```powershell
Get-EventLog -LogName System | Where-Object {$_.EventID -eq 6008} | Select-Object -First 1
```

---

### **Alternative: Checking Uptime**
You can also check system uptime to infer if it was properly shut down.

#### **Using Task Manager**
1. Press **Ctrl + Shift + Esc** to open **Task Manager**.
2. Go to the **Performance** tab.
3. Click on **CPU**.
4. Look at the **Up Time**—if it’s unusually long, the PC might not have been shut down properly.

#### **Using Command Prompt**
```sh
systeminfo | find "System Boot Time"
```
If the boot time is recent, the system restarted properly.

---

Would you like help automating this check? 😊