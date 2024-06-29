# Create a full-screen black overlay with highest priority
Add-Type -AssemblyName PresentationFramework

# Create a semi-transparent black overlay window
$overlay = New-Object Windows.Window
$overlay.WindowStyle = 'None'
$overlay.ResizeMode = 'NoResize'
$overlay.Background = [System.Windows.Media.Brushes]::Black
$overlay.AllowsTransparency = $true
$overlay.Topmost = $true  # Set the window to be topmost
$overlay.WindowStartupLocation = 'Manual'
$overlay.Left = 0
$overlay.Top = 0
$overlay.Width = [System.Windows.SystemParameters]::PrimaryScreenWidth
$overlay.Height = [System.Windows.SystemParameters]::PrimaryScreenHeight

# Show the overlay window
$overlay.Show()

# Wait for 10 seconds
Start-Sleep -Seconds 6

# Close the overlay window
$overlay.Close()
