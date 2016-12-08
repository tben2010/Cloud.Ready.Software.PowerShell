$ServerInstance = 'DynamicsNAV100'
$ObjectPath = 'c:\AllObjects.txt'
$LogPath = 'c:\LogExportAllObjects'

Export-NAVApplicationObject2 -ServerInstance $ServerInstance -Path $ObjectPath -LogPath $LogPath

Split-NAVApplicationObjectFile -Source 'C:\_Workingfolder\NAV.10.0.14199.W1.DVD\APPLICATION\NAV.10.0.14199.W1.CUObjects.txt' -Destination 'C:\_Workingfolder\NAV.10.0.14199.W1.DVD\APPLICATION\Cu14199\'