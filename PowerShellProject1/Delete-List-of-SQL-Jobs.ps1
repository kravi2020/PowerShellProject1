
$srvname ="aussqltst02.dart.local"
$jobnames =Get-Content -Path C:\Temp\db340-jobnames.txt

$outfilename ="\\CARNAS02.dart.local\NASShare\SQLJobs\$srvname-decomm-job-list-$(get-date -format yyyyMMdd_mmss).txt" 
$header ="List of Jobs to delete as part of DB-340"

write-output "Start deleting jobs...$(get-date)" | Out-File $outfilename -Append
Write-Output  $header | Out-File $outfilename -Append
write-output $("-" * $header.length) | Out-File $outfilename -Append
Write-Output $jobnames |  out-file $outfilename -Append
write-output $("-" * $header.length) | Out-File $outfilename -Append
$i =0

foreach ($job in $jobnames) {


$jnameexists = Get-DbaAgentJob -SqlInstance $srvname -Job $job 

if ($jnameexists) {
$i++
write-Output ">>> Removing job..[$job] from [$srvname] $(get-date)" | Out-File $outfilename -Append

$removeoutput = Remove-DbaAgentJob -SqlInstance $srvname -Job $job 
$removeoutput
Write-Output $removeoutput | Out-File $outfilename -Append 

#Get-DbaAgentJob -SqlInstance $srvname -Job $job | Format-Table -AutoSize |  out-file $outfilename -Append 
}
else {
write-Output "Job..[$job] does not exist in [$srvname] $(get-date)" | Out-File $outfilename -Append
}

}

write-output "End deleting jobs...$(get-date)" | Out-File $outfilename -Append
write-output $("-" * $header.length) | Out-File $outfilename -Append

write-output "$i jobs deleted..." | Out-File $outfilename -Append

notepad $outfilename

