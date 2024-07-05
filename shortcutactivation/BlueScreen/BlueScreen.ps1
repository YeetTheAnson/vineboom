# Change directory to Music
Set-Location -Path ([Environment]::GetFolderPath("MyMusic"))

Function Set-Volume 
{
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,100)]
        [Int]
        $volume
    )

    # Calculate number of key presses. 
    $keyPresses = [Math]::Ceiling( $volume / 2 )
    
    # Create the Windows Shell object. 
    $obj = New-Object -ComObject WScript.Shell
    
    # Set volume to zero. 
    1..50 | ForEach-Object {  $obj.SendKeys( [char] 174 )  }
    
    # Set volume to specified level. 
    for( $i = 0; $i -lt $keyPresses; $i++ )
    {
        $obj.SendKeys( [char] 175 )
    }
}

# Call the function with the desired volume level
Set-Volume -volume 100

Start-Sleep -Seconds 8

(New-Object System.Media.SoundPlayer "BlueScreen.wav").Play()

