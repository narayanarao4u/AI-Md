# step by step guide to install php in ubuntu

To install PHP on an Ubuntu system, follow these step-by-step instructions. This guide assumes you are using an Ubuntu version that supports PHP 7.x or higher. You can adjust the version number as necessary if you want a specific version. 

### Step 1: Update the Package Index

First, ensure your package list is up to date. Open your terminal and run:

```bash
sudo apt update
```

### Step 2: Install PHP

To install PHP along with the most commonly used modules, run the following command:

```bash
sudo apt install php libapache2-mod-php php-mysql
```

Here, `libapache2-mod-php` is for Apache web server integration, and `php-mysql` is for MySQL database support. Adjust this command based on the specific PHP modules you need.

### Step 3: Check PHP Installation

Verify that PHP is installed correctly by checking the version:

```bash
php -v
```

This will display the PHP version that has been installed.

### Step 4: Install Additional PHP Modules (Optional)

Depending on your project requirements, you might need additional PHP modules. Some commonly used modules include:

- For XML support:
  ```bash
  sudo apt install php-xml
  ```

- For GD graphics support:
  ```bash
  sudo apt install php-gd
  ```

- For CURL support:
  ```bash
  sudo apt install php-curl
  ```

- For Zip file support:
  ```bash
  sudo apt install php-zip
  ```

You can find a comprehensive list of available PHP modules by running:

```bash
apt-cache search php | grep php-
```

### Step 5: Restart the Web Server

If you are using Apache as your web server, restart it to apply the changes:

```bash
sudo systemctl restart apache2
```

If you are using Nginx, you'll need to restart it instead:

```bash
sudo systemctl restart nginx
```

### Step 6: Test PHP with Apache or Nginx

To verify that PHP is working correctly with your web server, create a `phpinfo()` file in the web server's root directory.

For Apache, the default root directory is typically `/var/www/html/`. Run the following commands:

```bash
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
```

For Nginx, it might also be `/var/www/html/`, but make sure to check your server's configuration.

### Step 7: Access the PHP Info Page

Now, open a web browser and navigate to:

```
http://your_server_ip/info.php
```

Replace `your_server_ip` with the actual IP address of your server or `localhost` if you are accessing it locally.

You should see the PHP configuration page displaying various information about your PHP installation. This means PHP is successfully installed and configured.

### Step 8: (Optional) Secure the Installation

Once you confirm that PHP is working, for security reasons, you should delete the `info.php` file:

```bash
sudo rm /var/www/html/info.php
```

### Conclusion

You have successfully installed PHP on your Ubuntu server! You can now start developing PHP applications or run PHP-based websites. If you need to install a specific version of PHP or a different web server, please let me know!