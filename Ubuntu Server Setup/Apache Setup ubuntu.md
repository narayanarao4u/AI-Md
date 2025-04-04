Understood! You want to host three websites on Apache: one on the default port 80, one on port 81, and another on port 8001. Here's how you can do it:

1. **Install Apache** (if not already installed):
   ```bash
   sudo apt update
   sudo apt install apache2
   ```

2. **Configure Apache to listen on multiple ports**:
   Edit the `/etc/apache2/ports.conf` file:
   ```bash
   sudo nano /etc/apache2/ports.conf
   ```
   Add the following lines (if not already present):
   ```apacheconf
   Listen 80
   Listen 81
   Listen 8001
   ```
   Save and close the file.

3. **Create separate virtual host files for each website**:
   - **Default Website on Port 80**: Use the existing default configuration or create a new one.
     ```bash
     sudo nano /etc/apache2/sites-available/000-default.conf
     ```
     Ensure it looks something like this:
     ```apacheconf
     <VirtualHost *:80>
         ServerAdmin webmaster@localhost
         DocumentRoot /var/www/html
         # Other directives...
     </VirtualHost>
     ```

   - **Website on Port 81**: Create a new virtual host configuration.
     ```bash
     sudo nano /etc/apache2/sites-available/site81.conf
     ```
     Add the following:
     ```apacheconf
     <VirtualHost *:81>
         ServerAdmin webmaster@localhost
         DocumentRoot /var/www/site81
         ServerName site81.example.com
         # Other directives...
     </VirtualHost>
     ```
     Enable the site:
     ```bash
     sudo a2ensite site81.conf
     ```

   - **Website on Port 8001**: Create another virtual host configuration.
     ```bash
     sudo nano /etc/apache2/sites-available/site8001.conf
     ```
     Add the following:
     ```apacheconf
     <VirtualHost *:8001>
         ServerAdmin webmaster@localhost
         DocumentRoot /var/www/site8001
         ServerName site8001.example.com
         # Other directives...
     </VirtualHost>
     ```
     Enable the site:
     ```bash
     sudo a2ensite site8001.conf
     ```

4. **Create the document root directories**:
   ```bash
   sudo mkdir -p /var/www/site81
   sudo mkdir -p /var/www/site8001
   ```

5. **Set permissions** (optional, adjust as needed):
   ```bash
   sudo chown -R $USER:$USER /var/www/site81
   sudo chown -R $USER:$USER /var/www/site8001
   ```

6. **Restart Apache**:
   Apply the changes by restarting the Apache service:
   ```bash
   sudo systemctl restart apache2
   ```

7. **Verify the setup**:
   - Default website: `http://your_server_ip`
   - Website on port 81: `http://your_server_ip:81`
   - Website on port 8001: `http://your_server_ip:8001`

That should do the trick! 😊 Your Apache server should now host three different websites on three different ports. Let me know if you need any more help!