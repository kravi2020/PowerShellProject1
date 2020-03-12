
$QueryGetIP="select distinct local_net_address, local_tcp_port from sys.dm_exec_connections where local_net_address is not null"

$instance ="sv-wps-db-swt"

$1instance ="sv-dfwdc-dwds1"

[string]$instance= Read-Host -Prompt "Enter server name"
[int]$spid= Read-Host -Prompt "Enter SPID Number"
$foldername="C:\Amazon_Blockings"
if (-not (test-path -Path $foldername)) {New-Item -Path $foldername -ItemType directory}

$outfilename ="$foldername\$instance-Blocked-Spid-{$spid}-Details-$(get-date -Format yyyyMMdd_hh_mm_ss).txt"

[string]$query1 = @("exec dbadmin.dbo.usp_active;")

[string]$query2 = @("select session_id, client_net_address , client_tcp_port, connect_time , last_read , last_write, t.text  from sys.dm_exec_connections r
CROSS APPLY sys.dm_exec_sql_text(r.most_recent_sql_handle) AS t
where session_id in ($spid);")

[string]$query3= @("select status, open_transaction_count, session_id, login_time, host_name, program_name, client_interface_name, login_name from sys.dm_exec_sessions where open_transaction_count > 0;")


$results = Invoke-Sqlcmd -ServerInstance $instance -Database master -Query $query1 
$results | Out-File $outfilename -Append

$results1 = Invoke-Sqlcmd -ServerInstance $instance -Database master -Query $query2
$results1 | Format-Table -AutoSize | Out-File $outfilename -Append

$results2 = Invoke-Sqlcmd -ServerInstance $instance -Database master -Query $query3
$results2 | Format-Table -AutoSize | Out-File $outfilename -Append

Notepad $outfilename

#Invoke-Sqlcmd -ServerInstance sv-wps-db-swt -query "exec dbadmin.dbo.usp_active"

