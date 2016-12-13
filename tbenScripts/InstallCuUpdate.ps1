#Automatischer Download wird ausgeführt
$LaenderCode = 'W1'
$DownloadPfad = 'C:\_Workingfolder'

Get-NAVCumulativeUpdateFile -versions 2017 -CountryCode $LaenderCode -DownloadFolder $DownloadPfad

#Aktuelle Build Version holen
#Wie kann ich automatisch den -Path bzw.den Dateinamen ermittlen

$CuBuild = Get-Content -Raw -Path C:\_Workingfolder\NAV.10.0.14199.W1.DVD.CU01.json | ConvertFrom-Json | Select Build, filename

$CuBuild = $CuBuild.psobject.properties.value
write-host -ForegroundColor Yellow $CuBuild