# Install MS Sql Server in ubuntu

Microsoft SQL Server can be installed and run on **Ubuntu**, allowing users to leverage its powerful database capabilities in a Linux environment. Here’s a step-by-step guide for installing **MS SQL Server** on Ubuntu:

---

### **Supported Versions of Ubuntu**
Microsoft SQL Server is supported on:
- **Ubuntu 20.04 LTS**
- **Ubuntu 22.04 LTS**

Make sure your system meets the requirements before proceeding.

---

### **1. Update the System**
Start by updating your Ubuntu system to ensure all packages are up to date:

```bash
sudo apt update && sudo apt upgrade -y
```

---

### **2. Import Microsoft’s GPG Key**
To ensure package security, import the official Microsoft GPG key:

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
```

---

### **3. Add the Microsoft SQL Server Repository**
Add the repository for SQL Server:

```bash
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/mssql-server-2022.list)"
```

---

### **4. Install SQL Server**
Install the SQL Server package:

```bash
sudo apt update
sudo apt install -y mssql-server
```

---

### **5. Configure SQL Server**
Run the setup to configure the server:

```bash
sudo /opt/mssql/bin/mssql-conf setup
```

Follow the prompts to:
- Set the SQL Server edition (Evaluation, Developer, or Express).
- Configure the `sa` (System Administrator) password.
- Apply any additional configurations.

---

### **6. Verify the SQL Server Service**
Ensure the SQL Server service is running:

```bash
systemctl status mssql-server
```

To start or restart the service:
```bash
sudo systemctl start mssql-server
sudo systemctl restart mssql-server
```

---

### **7. Install SQL Server Tools**
To interact with SQL Server, install the command-line tools (`sqlcmd` and `bcp`):

1. Add the tools repository:
   ```bash
   sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list)"
   ```

2. Install tools:
   ```bash
   sudo apt update
   sudo apt install -y mssql-tools unixodbc-dev
   ```

3. Add tools to your PATH:
   ```bash
   echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
   source ~/.bashrc
   ```

---

### **8. Test the Connection**
Use `sqlcmd` to connect to the SQL Server instance:

```bash
sqlcmd -S localhost -U sa -P 'bsnl@123'
```

You should see a prompt like this:
```
1>
```
Enter SQL commands to interact with the database.

---

### **9. Manage SQL Server**
- To check logs:
  ```bash
  sudo journalctl -u mssql-server
  ```
- For automatic startup on boot:
  ```bash
  sudo systemctl enable mssql-server
  ```

---

### **Optional: Configure Firewall**
If accessing SQL Server remotely, open port **1433**:

```bash
sudo ufw allow 1433/tcp
sudo ufw reload
```

---

With these steps, Microsoft SQL Server should be successfully installed and configured on your Ubuntu system. Let me know if you need further assistance!

# how to allow ms sql server to connect from another system in lan


To allow Microsoft SQL Server to accept connections from another system on the **LAN**, you need to configure the server to listen for external connections and ensure the network setup allows access. Here’s a step-by-step guide:

---

### **1. Configure SQL Server to Listen on the Network**

1. **Edit the SQL Server Configuration**:
   Open the configuration file to set the network IPs and ports:
   ```bash
   sudo nano /etc/mssql/mssql.conf
   ```

2. **Uncomment and Update the `tcp` Settings**:
   Locate the `[network]` section and ensure the `tcpport` and `tcp` settings are correctly set:
   ```ini
   [network]
   tcpport=1433
   ipaddress=0.0.0.0
   ```

   - `tcpport`: Set it to `1433` (default) or any custom port.
   - `ipaddress`: Use `0.0.0.0` to listen on all network interfaces or specify the specific LAN IP address of your server.

3. **Save and Exit**:
   Save the file (`Ctrl+O`, `Enter`) and exit (`Ctrl+X`).

4. **Restart the SQL Server Service**:
   Apply the changes by restarting SQL Server:
   ```bash
   sudo systemctl restart mssql-server
   ```

---

### **2. Open the Firewall for SQL Server**

1. **Allow the SQL Server Port**:
   Open the default SQL Server port (`1433`) on the Ubuntu firewall:
   ```bash
   sudo ufw allow 1433/tcp
   ```

2. **Reload the Firewall**:
   Apply the changes:
   ```bash
   sudo ufw reload
   ```

3. **Verify the Firewall Rule**:
   Confirm that the port is open:
   ```bash
   sudo ufw status
   ```

---

### **3. Verify SQL Server is Listening on the Network**

1. **Check Listening Ports**:
   Use `netstat` or `ss` to verify SQL Server is listening on the correct port:
   ```bash
   sudo ss -tuln | grep 1433
   ```

   You should see output indicating that the server is listening, e.g.:
   ```
   tcp    LISTEN    0    128    0.0.0.0:1433    0.0.0.0:*
   ```

---

### **4. Test SQL Server Connectivity from Another System**

1. **Install SQL Server Tools on the Client (Optional)**:
   If the client system is Linux, install SQL Server tools (`sqlcmd`):
   ```bash
   sudo apt update
   sudo apt install -y mssql-tools unixodbc-dev
   ```

2. **Connect from the Client**:
   Use `sqlcmd` or another SQL client tool to connect:
   ```bash
   sqlcmd -S <server-ip>,1433 -U sa -P 'YourPassword'
   ```
   Replace `<server-ip>` with the LAN IP address of the SQL Server.

3. **For Windows Clients**:
   - Use **SQL Server Management Studio (SSMS)**.
   - In the "Connect to Server" dialog, use the LAN IP address and port, e.g., `192.168.1.100,1433`.

---

### **5. Additional Steps (If Needed)**

- **Enable Mixed Mode Authentication**:
   Ensure SQL Server is configured to allow both SQL Server and Windows Authentication modes. Modify the `/etc/mssql/mssql.conf` file and restart the service if necessary.

- **Check Router/Network Rules**:
   If your network uses a router or additional firewalls, ensure port 1433 is allowed between the client and server.

---

### **6. Troubleshooting**

- **Verify SQL Server Logs**:
   Check for any errors in SQL Server logs:
   ```bash
   sudo journalctl -u mssql-server
   ```

- **Ping Test**:
   Ensure the client can reach the server via ping:
   ```bash
   ping <server-ip>
   ```

- **Connection Errors**:
   If the connection fails, verify:
   - The server is listening on the correct port.
   - Firewall rules are correct.
   - Username/password credentials are valid.

---

This setup allows your SQL Server to accept connections from other systems on the same LAN. Let me know if you encounter any specific issues!


### this is final config 
```bash
    $ sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true

    $ sudo gedit /var/opt/mssql/msssl.conf  

    $ sudo gedit /var/opt/mssql/msssl.conf   
```

```ini
[sqlagent]
enabled = true

[licensing]
azurebilling = false

[EULA]
accepteula = Y

[language]
lcid = 1033

[network]
tcpport=1433
ipaddress=0.0.0.0
```