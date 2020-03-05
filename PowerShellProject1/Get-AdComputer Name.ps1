
 Get-ADComputer -Filter {OperatingSystem -like "*windows 7*"} -Properties OperatingSystem | Select-Object Name,OperatingSystem, DNSHostName | Sort-Object name


$computers = Get-ADComputer -Filter {OperatingSystem -like "*standard*"} -Properties OperatingSystem | Select-Object Name,OperatingSystem,DNSHostName


$computers = Get-ADComputer -Filter {name -like "TestSystem"}
 
foreach($computer in $computers)
{
    if(Test-Connection -ComputerName $computer.Name -Count 1 -Quiet)
    {
        $total = (Get-WmiObject Win32_PhysicalMemory -ComputerName $computer.Name | Measure-Object Capacity -Sum).Sum/1GB
        $visible = (Get-WmiObject Win32_OperatingSystem -ComputerName $computer.Name).TotalVisibleMemorySize/1MB
 
        if( ($total-$visible) -gt 2)
        {
            New-Object PSObject -Property @{
                Name = $computer.Name
                OS = $computer.OperatingSystem
                Memory = $total
                Visible = $visible
            }
        }
    }
}

