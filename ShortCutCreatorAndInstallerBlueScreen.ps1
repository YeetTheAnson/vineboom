Set-Location -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BSOD.ps1" -OutFile "BSOD.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.bat" -OutFile "BlueScreen.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.mp4" -OutFile "BlueScreen.mp4"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.ps1" -OutFile "BlueScreen.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.wav" -OutFile "BlueScreen.wav"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\BlueScreenPlayer - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\BlueScreenPlayer.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to BlueScreenPlayer.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Alt+S"
$Shortcut.WindowStyle = 7
$Shortcut.Save()