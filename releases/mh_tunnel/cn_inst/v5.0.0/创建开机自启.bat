
@echo off
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs

@REM echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\Chrome-v72.lnk" >> CreateShortcut.vbs

echo sLinkFile = "%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\mh_tunnel.lnk" >> CreateShortcut.vbs

echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%~dp0mh_tunnel.bat" >> CreateShortcut.vbs
@REM echo oLink.Arguments = "--user-data-dir=""%~dp0UserData""" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs

@echo on 
echo "开机自启创建成功"