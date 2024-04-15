Add-Type -AssemblyName System.Windows.Forms
$now = Get-Date
$targettime = [DateTime]::Today.AddHours(22) # Target time dd-mm-yyy
$RNDSleep = Get-Random -Minimum 30 -Maximum 170
$myshell = New-Object -com "Wscript.Shell"
clear
Write-Output "It's time for a small coffee!"
while ($now -lt $targettime) {
    Start-Sleep -Seconds ($RNDSleep)
    $now = Get-Date
    $myshell.sendkeys("{F13}")
    Write-Output $now
}
