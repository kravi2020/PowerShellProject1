$serverslist = @('devsql2016.dart.local','testsql2016.dart.local','testdstr01.dart.local','testdstr02.dart.local','aussqltst02.dart.local','aussqlst01.dart.local','aussqlst02.dart.local','carsqlst03.dart.local')

foreach($srvname in $serverslist) {

$srvname
$results =invoke-sqlcmd -ServerInstance $srvname -InputFile 'G:\My Drive\LTQueries\get-server-properties.sql'
$spconfigure = Invoke-Sqlcmd -ServerInstance $srvname -Query "exec sp_configure"
$results | Out-File c:\temp\$srvname-server_properties.txt | Format-Table -AutoSize
$spconfigure | Format-Table -AutoSize | Out-File c:\temp\$srvname-sp-configure-values.txt 
}
