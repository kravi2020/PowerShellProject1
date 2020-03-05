 Get-Content C:\temp\dartservers.txt | ForEach-Object  {
 
 write-host $_
 Get-DbaComputerSystem -ComputerName $_ | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\DartDBServers-info.csv -NoTypeInformation  -Append -Force
 #Get-DbaDiskSpace -ComputerName $_ | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\Cumulative.csv -NoTypeInformation -Append -Force
 } 

