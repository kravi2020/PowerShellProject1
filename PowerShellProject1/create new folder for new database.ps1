$Full_folderpath ="\\AUSNAS02\NASShare\Backups\DEVSQL2016\Full"
$Diff_folderpath ="\\AUSNAS02\NASShare\Backups\DEVSQL2016\Diff"
$Log_folderpath ="\\AUSNAS02\NASShare\Backups\DEVSQL2016\Logs"

$NewDb="ComponentRegistration"



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
