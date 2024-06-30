Set-Location -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/UpdateWallpaper/UpdateWallpaper.bat" -OutFile "UpdateWallpaper.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/UpdateWallpaper/UpdateWallpaper.ps1" -OutFile "UpdateWallpaper.ps1"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\UpdateWallpaper - Shortcut.lnk")
$Shortcut.TargetPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\UpdateWallpaper.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to UpdateWallpaper.bat"
$Shortcut.WorkingDirectory = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
$Shortcut.Hotkey = "Alt+G"
$Shortcut.WindowStyle = 7
$Shortcut.Save()