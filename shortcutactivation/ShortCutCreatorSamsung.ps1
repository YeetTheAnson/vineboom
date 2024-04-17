$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\SamsungPlayer - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\SamsungPlayer.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to SamsungPlayer.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Ctrl+M"
$Shortcut.WindowStyle = 7
$Shortcut.Save()
