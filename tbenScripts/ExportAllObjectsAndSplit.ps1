$ServerInstance = 'DynamicsNAV100'
$ObjectPath = 'c:\AllObjects.txt'
$LogPath = 'c:\LogExportAllObjects'

Export-NAVApplicationObject2 -ServerInstance $ServerInstance -Path $ObjectPath -LogPath $LogPath

Split-NAVApplicationObjectFile -Source $ObjectPath -Destination 'c:\Users\tben\Dropbox\NAV2017\'