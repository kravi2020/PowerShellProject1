$Full_folderpath ="\\CARNAS02\NASShare\Backups\DEVSQLSERVER1\Full"
$Diff_folderpath ="\\CARNAS02\NASShare\Backups\DEVSQLSERVER1\Diff"
$Log_folderpath ="\\CARNAS02\NASShare\Backups\DEVSQLSERVER1\Logs"


#$NewDb="DDS"

$dbname = Invoke-Sqlcmd -ServerInstance "DEVSQLSERVER1\DEV" -Query "SELECT NAME FROM SYS.DATABASES WHERE NAME NOT IN ('TEMPDB','MODEL')"

FOREACH ($NAMES IN $dbname)

{

Write-Host $NAMES.NAME
$newdb = $NAMES.NAME




$Checkbackuppath1 = "$full_folderpath\$newdb"

if (-Not (Test-Path -Path $Checkbackuppath1))
{
    New-Item -ItemType directory -Path $Checkbackuppath1
}

$Checkbackuppath2 = "$Diff_folderpath\$newdb"

if (-Not (Test-Path -Path $Checkbackuppath2))
{
    New-Item -ItemType directory -Path $Checkbackuppath2
}

$Checkbackuppath3 = "$Log_folderpath\$newdb"

if (-Not (Test-Path -Path $Checkbackuppath3))
{
    New-Item -ItemType directory -Path $Checkbackuppath3
}
}