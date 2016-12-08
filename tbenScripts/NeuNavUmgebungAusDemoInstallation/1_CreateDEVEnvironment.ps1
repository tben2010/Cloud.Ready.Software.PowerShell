# Import settings
. (Join-Path $PSScriptRoot '_Settings.ps1') -ErrorAction Stop

$CopyFromServerInstance = Get-NAVServerInstance $DefaultServerInstance -ErrorAction Stop

$Backupfile = $CopyFromServerInstance | Backup-NAVDatabase -ErrorAction Stop

$CopyFromServerInstance | Enable-NAVServerInstancePortSharing

#New-NAVEnvironment
if (-not(get-navserverinstance $NewServerInstance)){
    #New-NAVEnvironment -ServerInstance $OriginalServerInstance -BackupFile $Backupfile -ErrorAction Stop -EnablePortSharing -LicenseFile $License
    New-NAVEnvironment -ServerInstance $NewServerInstance -DatabaseServer $DatabaseServer -DatabaseInstance $DatabaseInstance -BackupFile $Backupfile -ErrorAction Stop -EnablePortSharing -LicenseFile $License
    
}

$Backupfile | Remove-Item -Force

Get-NAVServerInstanceDetails | where serverinstance -match $AppName | select ServerInstance, DatabaseName, ClientServicesPort, State | ft -AutoSize
