$filename ="\\AUSNAS02.dart.local\NASShare\DBAScripts\LONG-6507.sql"

Invoke-Sqlcmd -ServerInstance devsql2016.dart.local -Database DartAdmin -Query $filename
