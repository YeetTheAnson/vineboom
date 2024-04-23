$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\LemonPlayer - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\LemonPlayer.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to LemonPlayer.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Alt+B"
$Shortcut.WindowStyle = 7
$Shortcut.Save()
