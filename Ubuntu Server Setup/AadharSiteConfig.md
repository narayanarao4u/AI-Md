The error "Forbidden: You don't have permission to access this resource" typically indicates a permissions or configuration issue with your Apache virtual host setup. Here are steps to diagnose and resolve the issue:

---

### 1. **Check Apache Virtual Host Configuration**
Verify your virtual host configuration file for port `82`. Open it for editing:
```bash
sudo nano /etc/apache2/sites-available/website2.conf
```

Ensure it resembles the following structure:
```apache
<VirtualHost *:82>
    ServerName yourdomain.com
    DocumentRoot /mnt/fileUploadVolume/website2

    <Directory /mnt/fileUploadVolume/website2>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

---

### 2. **Enable the Site Configuration**
Enable the virtual host configuration:
```bash
sudo a2ensite website2.conf
```

Reload Apache to apply the changes:
```bash
sudo systemctl reload apache2
```

---

### 3. **Check File and Directory Permissions**
Ensure the Apache user (`www-data`) has access to the document root and its contents:
```bash
sudo chown -R www-data:www-data /mnt/fileUploadVolume/website2
sudo chmod -R 755 /mnt/fileUploadVolume/website2
```

If your site requires writable directories (e.g., for uploads), grant additional write permissions only to specific directories:
```bash
sudo chmod -R 775 /mnt/fileUploadVolume/website2/uploads
```

---

### 4. **Verify SELinux (if applicable)**
If SELinux is enabled, ensure the appropriate context is applied:
```bash
sudo apt install policycoreutils
sudo chcon -R --type=httpd_sys_content_t /mnt/fileUploadVolume/website2
sudo chcon -R --type=httpd_sys_rw_content_t /mnt/fileUploadVolume/website2/uploads
```

---

### 5. **Ensure Apache is Listening on Port 82**
Update the Apache ports configuration if necessary:
```bash
sudo nano /etc/apache2/ports.conf
```

Ensure it contains:
```apache
Listen 82
```

Restart Apache to apply the changes:
```bash
sudo systemctl restart apache2
```

---

### 6. **Check Apache Logs**
If the issue persists, check the error log for detailed information:
```bash
sudo tail -f /var/log/apache2/error.log
```

---

### 7. **Firewall Configuration**
Ensure port `82` is open in your firewall:
```bash
sudo ufw allow 82
sudo ufw reload
```

---

### Testing
After applying these steps, access the site using:
```
http://yourdomain.com:82
```

If issues persist, share the Apache error logs for further troubleshooting.