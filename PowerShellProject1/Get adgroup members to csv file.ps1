# reference url https://gallery.technet.microsoft.com/scriptcenter/Export-all-AD-groups-and-3ae6fb42

# Create folder if not exists

$Checkbackuppath1="C:\AD_Groups"

if (-Not (Test-Path -Path $Checkbackuppath1))
{
    New-Item -ItemType directory -Path $Checkbackuppath1
    Write-Host $Checkbackuppath1 " Folder Created on " + Get-Date
}


$CSVOutput = @() 

$DateTime = Get-Date -f "yyyy-MM" 
 
#// Set CSV file name 
$CSVFile = "C:\AD_Groups\AD_Groups_"+$DateTime+".csv" 
$i=0 
$tot = $ADGroups.count 

$Adgroups = Get-ADGroup -Filter * | select name



foreach ($Adgroup in $Adgroups)
{
if($adgroup.name -like "*db*")

{

    $i++ 
    $status = "{0:N0}" -f ($i / $tot * 100) 
    Write-Progress -Activity "Exporting AD Groups" -status "Processing Group $i of $tot : $status% Completed" -PercentComplete ($i / $tot * 100) 

$Members = "" 
$MembersArr= Get-ADGroupMember -Identity $Adgroup.name | select name, category, scope, members

if ($MembersArr) {  
        foreach ($Member in $MembersArr) { 

$Members = $Members + "," + $Member.Name  
}
}
        if ($Members) { 
            $Members = $Members.Substring(1,($Members.Length) -1) 
        } 
    $HashTab = $NULL 
    $HashTab = [ordered]@{ 
        "Name" = $ADGroup.Name 
        "Members" = $Members 
            
}
$CSVOutput += New-Object PSObject -Property $HashTab 

}

}

$CSVOutput

$CSVOutput | Sort-Object Name | Export-Csv $CSVFile -NoTypeInformation 


notepad $CSVFile