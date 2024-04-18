$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\AmongusPlayer - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\AmongusPlayer.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to AmongusPlayer.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Alt+N"
$Shortcut.WindowStyle = 7
$Shortcut.Save()
