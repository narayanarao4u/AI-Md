@echo off
setlocal

echo Enabling Remote Desktop...

REM Enable Remote Desktop by setting fDenyTSConnections to 0
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM Allow Remote Desktop through the firewall
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

echo Remote Desktop has been enabled.
pause
