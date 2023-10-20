# Get a list of all Wi-Fi profile names
$wifiProfiles = netsh wlan show profile | Select-String "All User Profile" | ForEach-Object { $_ -replace "All User Profile\s*:\s*", "" }

# Create or overwrite a text file to save the profile information
$outputFile = "WiFiProfiles-$env:username.txt"
$null > $outputFile

# Iterate through the profile names and save their information to the text file
foreach ($profile in $wifiProfiles) {
    $profile = $profile.Trim()  # Remove leading and trailing spaces
    Add-Content -Path $outputFile -Value ("Wi-Fi Profile: $profile")
    $profileInfo = netsh wlan show profile name="$profile" key=clear | findstr Key
    Add-Content -Path $outputFile -Value $profileInfo
    Add-Content -Path $outputFile -Value ""
}

Write-Host "Wi-Fi profile information saved to $outputFile"
