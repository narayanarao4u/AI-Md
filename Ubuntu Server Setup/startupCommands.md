### Mount
```bash
    sudo mount /dev/sdb1  /mnt/fileUploadVolume
```

```bash
    cd /mnt/fileUploadVolume/nodeserver_adodb
    sudo pm2  start index.js --name=fileupload

```

```bash
    cd /mnt/fileUploadVolume/AadharComplaints/Backend/
    sudo pm2 start server.js --name=AadharAPI
    sudo pm2 start /mnt/fileUploadVolume/ServiceDir/backend/src/index.js --name=ServiceDir

```

```bash
    sudo code . --user-data-dir="~/.vscode-root"
    sudo code /var/www/  --user-data-dir='.' --no-sandbox
```

## urlrewrite in Ubuntu Apache
```bash
    sudo a2enmod rewrite
```