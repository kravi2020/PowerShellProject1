$srvlistarray =@('devsql2016.dart.local','dbcltest.dart.local','dbclstage.dart.local','dbclprod.dart.local')

$pubfilename = new-item -path "c:\temp\" -Name "Publications-List-$(get-date -Format yyyyMMdd-hh-mm-ss).txt"

foreach ($server in $srvlistarray) {

$srvname =$server
$dbname ="DartAdmin"



$publist = Invoke-Sqlcmd -ServerInstance $srvname -database $dbname -query "exec sp_helppublication"

Write-Output "List of Publications from Server: {$srvname}, Database: {$dbname}" | Out-File $pubfilename -Append
Write-Output ("-" * "List of Publications from Server: {$srvname}, Database: {$dbname}".Length) | Out-File $pubfilename -Append

$publist | select pubid, name, status, immediate_sync, allow_anonymous, description | Sort-Object pubid | format-table | Out-File $pubfilename -Append

}

notepad $pubfilename
