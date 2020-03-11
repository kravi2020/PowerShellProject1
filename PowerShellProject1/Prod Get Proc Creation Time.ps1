<#
$procname ="pr_count_summary"

Invoke-Sqlcmd -ServerInstance dbclprod.dart.local -Query "
use DartAdmin
select db_name() [DbName], name, type_desc, create_date from DartAdmin.sys.objects where name ='$procname'
use DartProd
select db_name() [DbName], name, type_desc, create_date from dartprod.sys.objects where name ='$procname'
use DART2019_001
select db_name() [DbName], name, type_desc, create_date from DART2019_001.sys.objects where name ='$procname'
use DART2019_002
select db_name() [DbName], name, type_desc, create_date from DART2019_002.sys.objects where name ='$procname'
use Dart2020_001
select db_name() [DbName], name, type_desc, create_date from Dart2020_001.sys.objects where name ='$procname'
use Dart2020_002
select db_name() [DbName], name, type_desc, create_date from Dart2020_002.sys.objects where name ='$procname'"
#>

#$srvname = Read-Host -Prompt 'Input your server  name'
#$procname = Read-Host -Prompt 'Input procedure name'

$srvname ="dbclstage.dart.local"
$procname ="pr_output_bnc"

$databases = New-Object System.Collections.ArrayList

$dblist = invoke-sqlcmd -ServerInstance $srvname -Database dartadmin -Query "select shard_name from dbo.shard"

foreach ($db in $dblist) {
$databases.Add($db.shard_name)
}

foreach ($dn in $databases) {
Invoke-Sqlcmd -ServerInstance $srvname -Database $dn -Query "select db_name() [DbName],  name, type_desc, modify_date from sys.objects where name ='$procname'" 
#Invoke-Sqlcmd -ServerInstance $srvname -Database $dn -Query "select db_name() [DbName],  name, type_desc, create_date from sys.objects where name ='$procname'" 
}


