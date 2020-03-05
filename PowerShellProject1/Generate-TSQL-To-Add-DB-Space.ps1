$sqlVariable = "Addgb=$addgb", "dbname=$dbsname"


# Generate TSQL Command

[int]$addgb =15
[string]$dbsname ="dbadmin"
[string]$servername ="dbclprod.dart.local"

$QueryFile = "G:\My Drive\LTQueries\Generate-TQL-To-Add-DBSpace.sql"

try {

Invoke-Sqlcmd -ServerInstance $servername -Database $dbsname -InputFile $QueryFile -Variable $sqlVariable

}

catch [Exception] {

Write-Host "Error:  $_.Exception"

}