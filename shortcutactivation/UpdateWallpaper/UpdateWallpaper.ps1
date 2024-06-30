# Define the URL of the image and the local path to save it
$imageUrl = "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/UpdateWallpaper/Trial.png"
$localPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Trial.png"

# Create the directory if it doesn't exist
$directory = [System.IO.Path]::GetDirectoryName($localPath)
if (-not (Test-Path -Path $directory)) {
    New-Item -ItemType Directory -Path $directory
}

# Download the image from the URL
Invoke-WebRequest -Uri $imageUrl -OutFile $localPath

# Define the function to set the wallpaper
function Set-Wallpaper {
    param (
        [string]$imagePath
    )

    Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

    $SPI_SETDESKWALLPAPER = 0x0014
    $SPIF_UPDATEINIFILE = 0x01
    $SPIF_SENDCHANGE = 0x02

    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, $SPI_SETDESKWALLPAPER, $imagePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
}

# Set the downloaded image as the wallpaper
Set-Wallpaper -imagePath $localPath
