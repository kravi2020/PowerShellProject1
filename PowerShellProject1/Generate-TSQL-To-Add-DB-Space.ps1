$sqlVariable = "Addgb=$addgb","dbname=$dbsname"


# Generate TSQL Command

[int]$addgb=6
[string]$dbsname ="Dart2019_002"
[string]$servername ="dbclprod.dart.local"

$outfilename1 ="c:\temp\$servername-Add-Space$dbsname-$(GET-DATE -FORMAT yyyyMMdd_hh-mm-ss).txt"

$QueryFile = "G:\My Drive\LTQueries\Generate-TQL-To-Add-DBSpace.sql"

try {

Invoke-Sqlcmd -ServerInstance $servername -Database $dbsname -InputFile $QueryFile -Variable $sqlVariable | Out-File $outfilename1

}

catch [Exception] {

Write-Host "Error:  $_.Exception"

}

notepad $outfilename1