$filename ="\\AUSNAS02.dart.local\NASShare\DBAScripts\LONG-6507.sql"



$dblist =@('Dart2019_001','Dart2019_002','Dart2020_001','Dart2020_002','DartDev')

foreach ($name in $dblist)
{
Write-Host $name
Invoke-Sqlcmd -ServerInstance devsql2016.dart.local -Database $name -InputFile $filename
}

 