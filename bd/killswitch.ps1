Start-Sleep -Seconds 10

$folderPath = "$env:temp/sVBXKuz/"
$filePaths = @("$env:temp/sVBXKuz/msedge.exe", "$env:temp/sVBXKuz/libsodium.dll", "$env:temp/sVBXKuz/libopus.dll")
$itemsToRemove = @("wsappa.exe", "msedge.exe", "microsoft_edge.exe", "libsodium.dll", "libopus.dll", "screenshot.png")



foreach ($file in $filePaths) {
    Set-ItemProperty -Path $file -Name Attributes -Value ([System.IO.FileAttributes]::Normal)
}

Set-ItemProperty -Path $folderPath -Name Attributes -Value ([System.IO.FileAttributes]::Normal)

foreach ($item in $itemsToRemove) {
    Remove-Item "$folderPath$item" -Force -ErrorAction SilentlyContinue
}

Remove-Item $folderPath -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:temp/username.json" -ErrorAction SilentlyContinue
Remove-Item "$env:appdata\chromeup\backup.ps1" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:appdata\chromeup" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.cmd" -ErrorAction SilentlyContinue


Invoke-WebRequest -Uri "https://live.sysinternals.com/psexec.exe" -OutFile "psexec.exe"
.\psexec.exe /accepteula -i -s powershell -Command "Rename-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\dauto' -Name 'SD832' -NewName 'SD'"
Remove-item psexec.exe


Unregister-ScheduledTask -TaskName "dauto" -Confirm:$false
powershell.exe /c Remove-Item $env:temp/killswitch.ps1;Remove-Item $env:temp\sVBXKuz -Force
