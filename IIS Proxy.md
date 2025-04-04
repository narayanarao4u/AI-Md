Here’s a detailed guide on setting up a proxy server using **IIS**, **Application Request Routing (ARR)**, and **URL Rewrite** in Windows.

### Prerequisites
1. **IIS** (Internet Information Services) must be installed on your Windows machine.
2. You need **Application Request Routing (ARR)** and **URL Rewrite** modules installed for IIS.

Let’s get started!

---

### Step 1: Install IIS on Windows

1. **Open Windows Features**:
   - Press `Windows + R` to open the **Run** dialog.
   - Type `appwiz.cpl` and press Enter.
   - On the left, click **Turn Windows features on or off**.

2. **Install IIS**:
   - Scroll down and find **Internet Information Services**.
   - Check the box to install IIS and ensure that **Web Management Tools** and **World Wide Web Services** are selected.
   - Expand **World Wide Web Services > Application Development Features** and check **CGI**, **ISAPI Extensions**, and **ISAPI Filters** (if not already checked).
   - Click **OK** to install IIS.

3. **Verify Installation**:
   - After installation, open your web browser and go to `http://localhost/`. If IIS is correctly installed, you should see the default IIS page.

---

### Step 2: Install Application Request Routing (ARR) and URL Rewrite Modules

1. **Download ARR and URL Rewrite**:
   - Go to the official Microsoft IIS website and download **Application Request Routing (ARR)** and **URL Rewrite** modules.
     - [ARR Download Link](https://www.iis.net/downloads/microsoft/application-request-routing)
     - [URL Rewrite Download Link](https://www.iis.net/downloads/microsoft/url-rewrite)

2. **Install ARR**:
   - Run the **ARR** installer and follow the prompts to complete the installation.

3. **Install URL Rewrite**:
   - Run the **URL Rewrite** installer and follow the installation instructions.

4. **Restart IIS**:
   - After installation, restart IIS using the following steps:
     - Open **Command Prompt** as Administrator.
     - Type `iisreset` and press Enter.

---

### Step 3: Configure IIS as a Reverse Proxy

1. **Open IIS Manager**:
   - Press `Windows + S` and type **IIS Manager** to open the IIS Management Console.

2. **Enable Proxy in ARR**:
   - In the IIS Manager, click on the server node (this is usually the name of your machine) in the left-hand tree.
   - In the center panel, double-click **Application Request Routing Cache**.
   - In the right panel (Actions), click **Server Proxy Settings**.
   - Check **Enable proxy** and click **Apply**.

3. **Set Up URL Rewrite**:
   - Now, go back to the left-hand tree and expand the server node.
   - Right-click **Sites** and click **Add Website** to create a new site if you don’t already have one.
     - **Site name**: Name your site (e.g., ProxyServer).
     - **Physical Path**: Set a folder for the website files (can be an empty folder).
     - **Binding**: Choose a port (e.g., HTTP, port 80 or 8080).

4. **Add URL Rewrite Rules**:
   - Select your site from the left panel.
   - In the center panel, double-click **URL Rewrite**.
   - In the right panel, click **Add Rule(s)** and select **Blank Rule**.

---

### Step 4: Configure Proxy Settings in URL Rewrite

1. **Define the Rule**:
   - In the **Add Rule** window, under **Name**, give the rule a descriptive name (e.g., ProxyRule).
   - In the **Match URL** section, set **Requested URL** to **Matches the Pattern** and **Using** to **Regular Expressions**.
   - In **Pattern**, enter `.*` (this matches all URLs).

2. **Add Action for Forwarding**:
   - Scroll down to the **Action** section.
   - **Action type**: Set to **Rewrite**.
   - **Rewrite URL**: Set the destination URL (the server to which you want to proxy requests). For example:
     - `http://backendserver/{R:0}` (replace `backendserver` with the actual server IP or domain).
   - Ensure **Append query string** is checked.
   - Click **Apply**.

3. **Save and Apply the Rule**:
   - In the **Actions** panel on the right, click **Apply** to save the rewrite rule.

---

### Step 5: Configure Client Devices to Use the Proxy

Once IIS is configured, you can set your LAN clients to use the proxy.

1. **Find the Proxy Server IP Address**:
   - Open **Command Prompt** and type `ipconfig`.
   - Note the **IPv4 Address** of the server machine running IIS.

2. **Configure LAN Clients**:
   - On each client machine, configure the proxy settings.
     - For Windows: Go to **Settings > Network & Internet > Proxy**.
     - Under **Manual proxy setup**, turn on **Use a proxy server**.
     - Enter the IP address of the IIS server and the port number you used (e.g., 8080).

---

### Step 6: Test the Proxy Server

Now that the proxy is set up:

1. Open a browser on a client device.
2. Navigate to a website.
3. If the proxy server is working correctly, the web traffic should pass through your IIS reverse proxy.

---

### Optional: Configure Security and Access Control

- You can add more rules to limit access based on IP addresses or enforce authentication by setting additional URL Rewrite rules or adding authorization settings in IIS.

This setup works well for basic web proxying, and with **ARR**, it can handle load balancing and more advanced features if needed.