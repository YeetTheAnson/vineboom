$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$PSScriptRoot\BlackScreen - Shortcut.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\BlackScreen.bat"
$Shortcut.Arguments = ""
$Shortcut.Description = "Shortcut to BlackScreen.bat"
$Shortcut.WorkingDirectory = $PSScriptRoot
$Shortcut.Hotkey = "Alt+A"
$Shortcut.WindowStyle = 7
$Shortcut.Save()