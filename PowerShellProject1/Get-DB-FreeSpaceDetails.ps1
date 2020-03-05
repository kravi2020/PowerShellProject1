$scriptfilelocation ="G:\My Drive\LTQueries\Get-db-free-space.sql"

$dblist = @('dart2020_001','Dart2020_002')
$servername = "dbclprod.dart.local"

try {
foreach ($dbname in $dblist) {
Write-Host "Free space details from " $dbname " database.."
$results = Invoke-Sqlcmd -ServerInstance $servername -Database $dbname -InputFile $scriptfilelocation 

$results | Format-Table -AutoSize 

$results | Format-Table -AutoSize  | Out-File c:\temp\$servername-FreespaceDetails.txt -Append

}

}

catch {
Write-Host "Error: $_.exception"
}

## Generate TSQL Script

$sqlVariable = "Addgb=$addgb", "dbname=$dbsname"


# Generate TSQL Command

[int]$addgb = 1
[string]$dbsname ="dart2020_001"
#[string]$servername ="dbclprod.dart.local"

$QueryFile = "G:\My Drive\LTQueries\Generate-TQL-To-Add-DBSpace.sql"

Write-Host "T-SQL to Execute on " $dbsname " database.."

try {

Invoke-Sqlcmd -ServerInstance $servername -Database $dbsname -InputFile $QueryFile -Variable $sqlVariable

}

catch [Exception] {

Write-Host "Error:  $_.Exception"

}
