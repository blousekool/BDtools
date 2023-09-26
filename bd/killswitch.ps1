Start-Sleep 10
Remove-Item $env:temp\sVBXKuz\wsappa.exe -Force
Remove-Item $env:temp\sVBXKuz\libsodium.dll -Force
Remove-Item $env:temp\sVBXKuz\libopus.dll -Force
cd..
Remove-Item $env:temp\sVBXKuz -Force
Remove-Item $env:temp\username.json
Unregister-ScheduledTask -TaskName "AutoUpdaterD" -Confirm:$false
powershell.exe /c Remove-Item $env:temp/killswitch.ps1
