
$wifiProfiles = netsh wlan show profile | Select-String "All User Profile" | ForEach-Object { $_ -replace "All User Profile\s*:\s*", "" }


$outputFile = "WiFiProfiles-$env:username.txt"
$null > $outputFile


foreach ($profile in $wifiProfiles) {
    $profile = $profile.Trim()  # Remove leading and trailing spaces
    Add-Content -Path $outputFile -Value ("Wi-Fi Profile: $profile")
    $profileInfo = netsh wlan show profile name="$profile" key=clear | findstr Key
    Add-Content -Path $outputFile -Value $profileInfo
    Add-Content -Path $outputFile -Value ""
}

Write-Host "Wi-Fi profile information saved to $outputFile"
