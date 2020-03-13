Import-Module FailoverClusters  
  
$cluster = "AUSSQLSTCL01"  
$nodes = Get-ClusterNode -Cluster $cluster  
  
$nodes | Format-Table -property NodeName, State, NodeWeight  