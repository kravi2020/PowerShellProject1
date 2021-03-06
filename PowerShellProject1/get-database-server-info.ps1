# staging databases 

Get-DbaComputerSystem -ComputerName aussqlst01 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\aussqlst01-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName aussqlst02 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\aussqlst02-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName carsqlst03 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\carsqlst03-info.csv -NoTypeInformation  


Get-DbaDiskSpace -ComputerName aussqlst02 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\aussqlst02.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName carsqlst03 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\carsqlst03.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName aussqlst01 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\aussqlst01.csv -NoTypeInformation

#staging distributor

Get-DbaComputerSystem -ComputerName ausdist01 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\ausdist01-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName ausdist02 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\ausdist02-info.csv -NoTypeInformation  

Get-DbaDiskSpace -ComputerName ausdist01 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\ausdist01.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName ausdist02 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\ausdist02.csv -NoTypeInformation

# staging ssrs

Get-DbaComputerSystem -ComputerName ausssrsst01 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\ausssrsst01-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName ausssrsst02 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\ausssrsst02-info.csv -NoTypeInformation  

Get-DbaDiskSpace -ComputerName ausssrsst01 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\ausssrsst01.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName ausssrsst02 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\ausssrsst02.csv -NoTypeInformation

# Test databases 

Get-DbaComputerSystem -ComputerName testsql2016 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\testsql2016-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName aussqltst02 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\aussqltst02-info.csv -NoTypeInformation  

Get-DbaDiskSpace -ComputerName testsql2016 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\testsql2016.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName aussqltst02 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\aussqltst02.csv -NoTypeInformation

# Test distributor 

Get-DbaComputerSystem -ComputerName testdstr01 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\testdstr01-info.csv -NoTypeInformation  
Get-DbaComputerSystem -ComputerName testdstr02 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\testdstr02-info.csv -NoTypeInformation  

Get-DbaDiskSpace -ComputerName testdstr01 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\testdstr01.csv -NoTypeInformation
Get-DbaDiskSpace -ComputerName testdstr02 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\testdstr02.csv -NoTypeInformation

# DEV database

Get-DbaComputerSystem -ComputerName devsql2016 | Select-Object -Property ComputerName, Domain,Manufacturer,Model,SystemType,NumberLogicalProcessors,NumberProcessors,IsHyperThreading, TotalPhysicalMemory|Export-Csv -Path c:\temp\devsql2016-info.csv -NoTypeInformation  

Get-DbaDiskSpace -ComputerName devsql2016 | Select-Object ComputerName,Name,Label,Capacity,Free,PercentFree,BlockSize,FileSystem,SizeInMB,FreeInMB,SizeInGB,FreeInGB | Export-Csv -Path c:\temp\devsql2016.csv -NoTypeInformation


