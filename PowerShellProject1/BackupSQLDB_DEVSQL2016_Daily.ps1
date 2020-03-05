$Result = Invoke-Sqlcmd -query "select name from sys.databases d Where state_desc='ONLINE' and not name IN ('tempdb')" -ServerInstance 'DEVSQL2016'

foreach($item in $Result){

$dt = Get-Date -Format yyyyMMddHHmmss
$dbname = $item.name
$Path = '\\AUSNAS02\NASShare\Backups\DEVSQL2016\Full\'
$Full_path = $path +  $dbname  

#Backup-SqlDatabase –BackupAction Database -ServerInstance 'DEVSQL2016' -Database $dbname -BackupFile $Full_path\$($dbname)_db_Daily.bak  -CopyOnly -CompressionOption on -Initialize -MaxTransferSize 65537 

$filesuffix = $dbanme +"\"+ $dbname+"_db_Daily.bak"

$fullFileName = $Full_path+$filesuffix



if  (Test-Path -Path $fullFileName)
{
  Write-Host "File Exits : " $fullFileName
  Write-Host "Renaming File Before backup: " $fullFileName".old"
  
  #Rename-Item -Path $fullFileName -NewName $fullFileName".old" -Force
  
  Move-Item -Path $fullFileName -Destination $fullFileName".old" -Force

 # Remove-Item -Path $fullFileName -Force

}


$encryptionOption = New-SqlBackupEncryptionOption -Algorithm Aes256 -EncryptorType ServerCertificate -EncryptorName "Dev_Backup_Cert"  

Backup-SqlDatabase –BackupAction Database -ServerInstance 'DEVSQL2016' -Database $dbname -BackupFile $Full_path\$($dbname)_db_Daily.bak  -CopyOnly -CompressionOption on -MaxTransferSize 65537 -EncryptionOption $encryptionOption 



  Write-host "Backup database " $item.name
}
