
@echo off
reg add HKEY_CURRENT_USER\Console /v QuickEdit /t REG_DWORD /d 00000000 /f

start  mh_tunnel.exe


 



::pause



rem powershell Start-Process -WindowStyle hidden -FilePath "mh_tunnel.exe" 
