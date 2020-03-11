$ServerList = Get-Content "c:\batch\serverlistNonProd.txt"
$OutputFile = "c:\batch\BackupReportNonProd.htm"

$titleDate = Get-Date -UFormat "%m-%d-%Y - %A"
$HTML = '<style type="text/css">
    #Header{font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;width:100%;border-collapse:collapse;}
    #Header td, #Header th {font-size:14px;border:1px solid #98bf21;padding:3px 7px 2px 7px;}
    #Header th {font-size:14px;text-align:left;padding-top:5px;padding-bottom:4px;background-color:#A7C942;color:#fff;}
    #Header tr.alt td {color:#000;background-color:#EAF2D3;}
    </Style>'

$HTML += "<HTML><BODY><Table border=1 cellpadding=0 cellspacing=0 width=100% id=Header>
        <TR>
            <TH><B>Database Name</B></TH>
            <TH><B>RecoveryModel</B></TD>
            <TH><B>Last Full Backup Date</B></TH>
       
            <TH><B>Last Log Backup Date</B></TH>
        </TR>"

[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO') | Out-Null
foreach ($ServerName in $ServerList)
{
    #$HTML += "<TR bgColor='#a86da6'><TD colspan=5 align=center><B>$ServerName</B></TD></TR>"

    $SQLServer = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $ServerName

    $HTML += "<TR bgColor='#a86da6'><TD colspan=5 align=center><B> $($SQLServer.Name) </B></TD></TR>"

    foreach ($Database in $SQLServer.Databases)
    {
        IF ($Database.Status -eq 'Normal'){
        IF ($Database.Name -NOTLike '*tempdb'){ 
        IF ($Database.Name -ne 'model'){
        IF ($Database.Name -ne 'distribution'){
        IF ($Database.Name -ne 'sim12'){
        IF ($Database.Name -notlike '2013*'){
        IF ($Database.Name -notlike '2014*'){
        IF ($Database.Name -notlike '2015*'){
        IF ($Database.Name -notlike '2016*'){
        IF ($Database.Name -notlike '2017*'){
        $HTML += "<TR>
                    <TD>$($Database.Name)</TD>
                    <TD>$($Database.RecoveryModel)</TD>
                    <TD $(if ($Database.LastBackupDate -eq '01/01/0001 00:00:00') {'bgcolor="Red"> NA'} else {$(if ($Database.LastBackupDate -le  [DateTime]::Now.AddDays(-8)) {'bgcolor="Orange">' + $Database.LastBackupDate} else     {'>' + $Database.LastBackupDate})})</TD>
                    
                   
                    <TD>$(IF ($Database.RecoveryModel -eq 'Simple') {'NA'} else {$Database.LastLogBackupDate})</TD>
                </TR>"
         }
         }
         }
         }
         }
         }
         }
         }
         }
         }
    }
}



$emailSmtpServer = "smtp.gmail.com"
$emailSmtpServerPort = "587"
$emailSmtpUser = "svcDartProd@datascan.com"
$emailSmtpPass = "Cr@dle*9"
 
$emailMessage = New-Object System.Net.Mail.MailMessage
$emailMessage.From = "svcDartProd <svcDartProd@datascan.com>"
#$emailMessage.To.Add( "dba@datascan.com")
$emailMessage.To.Add( "pradeesh.mathew@datascan.com,ravi.kanneganti@datascan.com" )
#$emailMessage.To.Add( "ravi.kanneganti@datascan.com" )
$emailMessage.Subject = "Non-Production Backup Report e-mail"
$emailMessage.IsBodyHtml = $true
$emailMessage.Body = $HTML
$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );
 
$SMTPClient.Send( $emailMessage )

