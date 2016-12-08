$name = 'NAV2017W1Build13682'
$isofile = "C:\__Workingfolder\$name.iso"
$ConfigFile     = join-path $PSScriptRoot 'FullInstallNAV2017_ReplaceDB.xml'
$Licensefile    = "C:\Users\tben\Dropbox\NAV Lizenz\4804852_GOB MA_NAV2017_271016.flf"
$Log = 'C:\__Workingfolder\\Log.txt'
$Objectlibrary  = 'C:\_Workingfolder\ObjectLibrary'
$Exportfile = Join-Path $Objectlibrary "$name.zip"

$InstallationResult =    Install-NAVFromISO `        -ISOFilePath $isofile `        -ConfigFile $ConfigFile `
        -Licensefile $Licensefile `
        -Log $Log


Import-Module "$($InstallationResult.TargetPath)\RoleTailored Client\Microsoft.Dynamics.Nav.Model.Tools.psd1"
Import-Module "$($InstallationResult.TargetPathX64)\Service\NavAdminTool.ps1"
. "$($InstallationResult.TargetPathX64)\Service\NavAdminTool.ps1"

$CurrentServerInstance = Get-NAVServerInstance -ServerInstance $InstallationResult.ServerInstance

#Disable CompileBusinessApplicationAtStartup
$CurrentServerInstance | Set-NAVServerInstance -Stop
$null =     $CurrentServerInstance |        Set-NAVServerConfiguration `            -KeyName CompileBusinessApplicationAtStartup `            -KeyValue False
$CurrentServerInstance | Set-NAVServerInstance -Start

#Export Objects
if (-not (Test-Path $Exportfile)){
    write-host -foregroundcolor Green -Object "Exporting all objects to $Objectlibrary"
    
    $TempFile = "$env:TEMP\$name.txt"
        
    Export-NAVApplicationObject -DatabaseName $InstallationResult.Databasename -Path $TempFile -ExportTxtSkipUnlicensed

    #Get-Item $TempFile | Create-ZipFileFromPipedItems -zipfilename $Exportfile
    #Remove-Item $TempFile -Force
    
}
#UnInstall-NAVFromISO -ISOFilePath $isofile
#Drop-SQLDatabaseIfExists -Databasename 'NAV2016'



