
#Create a new Dev/Test - Environment
Get-NAVServerInstance -ServerInstance 'DynamicsNAV100' | Copy-NAVEnvironment -ToServerInstance 'Dev-NAV100'
Start-NAVIdeClient -ServerInstance 'Dev-NAV100' 


#Delete Environment
Remove-NAVEnvironment -ServerInstance 'Dev-NAV100'



#Exportiere all Objects
#Export Objects
$Objectlibrary  = 'C:\_Workingfolder\ObjectLibrary'
$Exportfile = Join-Path $Objectlibrary "$name.zip"
if (-not (Test-Path $Exportfile)){
    write-host -foregroundcolor Green -Object "Exporting all objects to $Objectlibrary"
    
    $TempFile = "$env:TEMP\$name.txt"
        
    Export-NAVApplicationObject -DatabaseName $InstallationResult.Databasename -Path $TempFile -ExportTxtSkipUnlicensed
}

#Entwicklungs Client starten
Start-NAVIdeClient -ServerInstance 'DynamicsNAV100' 

Start-NAVWindowsClient -ServerInstance 'DynamicsNAV100'