workflow run-pse 
{

param
(
[parameter(mandatory=$true)]
[string[]]$servername,

[parameter(mandatory=$true)]
[string[]]$dbname,

[parameter(mandatory=$true)]
[string[]]$qry


)
 

    foreach -parallel ($s in $ServerInstance)
{
Invoke-Sqlcmd -ServerInstance $s -Database $dbname -Query $qry 
}


}

run-pse -servername 'redgateprod.dart.local', 'devsql2016.dart.local' -dbname master -qry "select [ServerName]=@@servername, [Version]=@@version;"
