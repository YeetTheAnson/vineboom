Set-Location -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.bat" -OutFile "BlueScreen.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.mp4" -OutFile "BlueScreen.mp4"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.ps1" -OutFile "BlueScreen.ps1"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BlueScreen.wav" -OutFile "BlueScreen.wav"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\BlueScreen - Shortcut.lnk")
$Shortcut.TargetPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\BlueScreen.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to BlueScreen.bat"
$Shortcut.WorkingDirectory = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs"
$Shortcut.Hotkey = "Alt+S"
$Shortcut.WindowStyle = 7
$Shortcut.Save()
