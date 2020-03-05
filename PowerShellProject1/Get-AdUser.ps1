Clear-Host
Get-ADUser -identity rkanneganti -Properties * | select lockedout, lastlogondate, passwordlastset, passwordexpired, whenchanged

[datetime]::now.AddDays(-7)

