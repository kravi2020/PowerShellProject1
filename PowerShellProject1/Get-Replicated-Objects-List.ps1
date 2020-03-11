$srvname ="dbclstage.dart.local"
$dbname ="DartAdmin"

$slxpublications = New-Item -Name "$srvname-$dbname-Publications-Articles.txt" -Path c:\temp\ -Force

 

Write-Output "SalesLogix Database Published articles list- Generated at $(get-date)" | Out-File $slxpublications -Append

Write-Output $("-" * "SalesLogix Database Published articles list- Generated at $(get-date)".Length) | Out-File $slxpublications -Append

 

$pubdt = Invoke-Sqlcmd -ServerInstance $srvname -Database $dbname -query "exec sp_helppublication" 

 

foreach ($pp in $pubdt) {

$a =$pp.name

 

Write-Host "Publication: $($pp.name)"

 

if ($a -like '*snapshot*') {

$ptype ="SNAPSHOT"

}

else

{$ptype ="Transactional"}

 

 

Write-Output "Publication Name:  $a (Type: $ptype)" | Out-File $slxpublications -Append
Write-Output $("-" * "Publication Name:  $a (Type: $ptype)".Length ) | Out-File $slxpublications -Append

 

 

 

    $articles = Invoke-Sqlcmd -ServerInstance $srvname -Database $dbname -query "exec sp_helparticle '$a'" 

    $array = @()

    $i=1

    foreach ($aname in $articles) {

        Write-Host $aname.'base object'

        $b =$aname.'base object'

  $array+= "`r`n$i. $b"

  $i++

}

Write-Output "Article(s) in this Publication:`r`n  $array " | Out-File $slxpublications -Append

Write-Output $("_" * "Publication Name:  $a (Type: $ptype)".Length) | Out-File $slxpublications -Append

Write-Output $(" " * $aname.'base object'.Length) | Out-File $slxpublications -Append

}

 

notepad $slxpublications