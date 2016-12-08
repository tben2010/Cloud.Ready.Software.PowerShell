#The New Envirement
$AppName = 'Tben'

#The build environment
$WorkingFolder = 'C:\_Workingfolder'
$License = "C:\Users\tben\Dropbox\NAV Lizenz\4804852_GOB MA_NAV2017_271016.flf"

$NewServerInstance = "$($AppName)_DEV"

#Defaults
$DatabaseServer='WIN10'
$DatabaseInstance='NAVDEMO'
$DefaultServerInstance = 'DynamicsNAV100'
$NavAppWorkingFolder = join-path $WorkingFolder $AppName
$BackupPath = [io.path]::GetFullPath((Join-Path $PSScriptRoot '\..\'))