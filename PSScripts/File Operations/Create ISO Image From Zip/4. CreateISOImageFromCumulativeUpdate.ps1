$ZipFIle = "C:\_Workingfolder\NAV.10.0.14199.W1.DVD.zip"

$TmpLocation = 'C:\Temp'
$IsoDirectory = 'C:\_Workingfolder\'

$IsoFile = 
    New-NAVCumulativeUpdateISOFile `
        -CumulativeUpdateFullPath $ZipFIle `
        -TmpLocation $TmpLocation `
        -IsoDirectory $IsoDirectory

