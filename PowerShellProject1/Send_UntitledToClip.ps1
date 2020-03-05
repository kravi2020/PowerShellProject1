Function Send-UntitledToClip {
    $psISE.PowerShellTabs.Files | Where-Object {$_.IsUntitled} | ForEach-Object {
        $_.Editor.Text
    } | clip.exe
} 

Send-UntitledToClip

get-history