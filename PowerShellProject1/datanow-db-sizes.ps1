Get-DbaDbSpace -SqlInstance sql7.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql7-db-info.csv -NoTypeInformation 
Get-DbaDbSpace -SqlInstance sql6.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql6-db-info.csv -NoTypeInformation 
Get-DbaDbSpace -SqlInstance sql5.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql5-db-info.csv -NoTypeInformation 
Get-DbaDbSpace -SqlInstance sql4.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql4-db-info.csv -NoTypeInformation 
Get-DbaDbSpace -SqlInstance sql3.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql3-db-info.csv -NoTypeInformation 
Get-DbaDbSpace -SqlInstance sql2.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\sql2-db-info.csv -NoTypeInformation 

Get-DbaDbSpace -SqlInstance sql-admin.cds.com  -ExcludeDatabase tempdb, model | Select-Object SqlInstance,Database,FileName,FileGroup,PhysicalName,FileType,UsedSpace,FreeSpace,FileSize,PercentUsed | Export-Csv -Path c:\temp\SQL-ADMIN-db-info.csv -NoTypeInformation 


