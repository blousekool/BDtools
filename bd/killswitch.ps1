Remove-Item $env:temp\sVBXKuz -Force
Remove-Item $env:appdata\chromeup -Force
Unregister-ScheduledTask -TaskName "AutoUpdaterD" -Confirm:$false
powershell.exe /c Remove-Item $env:temp/killswitch.ps1