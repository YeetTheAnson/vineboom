$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\funny.bat - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\funny.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to funny.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Ctrl+Alt+T"
$Shortcut.WindowStyle = 7
$Shortcut.Save()
