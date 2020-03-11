$servername = "dbclprod.dart.local"
$scriptfilelocation ="G:\My Drive\LTQueries\Get-db-free-space.sql"

$a = New-Object System.Collections.ArrayList

$a =  Invoke-Sqlcmd -ServerInstance $servername -Database master -query "select name, state_desc, recovery_model_desc from sys.databases where name in ('dartprod','dart2019_001','dart2019_002','dart2020_001','dart2020_002')"

#$a =  Invoke-Sqlcmd -ServerInstance $servername -Database dartadmin -query "select shard_name as name from dartadmin.dbo.shard"


Write-Host $a.Count

$outfilename ="c:\temp\$servername-FreespaceDetails-$(GET-DATE -FORMAT yyyyMMdd_hh-mm-ss).txt"

try {

foreach ($name in $a)
{
if ($name.state_desc -eq "ONLINE")
{

Write-Host "Free space details from " $name.name " database.."

$results = Invoke-Sqlcmd -ServerInstance $servername -Database $name.name -InputFile $scriptfilelocation 

$results | Format-Table -AutoSize 

$results | Format-Table -AutoSize  | Out-File $outfilename  -Append

}

}
}

catch {
Write-Host "Error: $_.exception"
}

notepad $outfilename 
