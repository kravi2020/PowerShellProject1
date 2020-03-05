$tmfilename ="G:\My Drive\teamviewer-code.txt"
Get-ChildItem $tmfilename

Add-Content -Value "3z33iz $(get-date)" -Path $tmfilename -PassThru
get-content $tmfilename
notepad $tmfilename

