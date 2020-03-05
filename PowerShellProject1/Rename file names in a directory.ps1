$FilePath = Get-ChildItem "\\AUSNAS02\NASShare\Backups\DEVSQL2016\logs" -Recurse -File
$Addtext ="Pre_Encrypt_"

foreach ($file in $FilePath)
{
    $newName = $file.Basename.replace($file.BaseName,"$Addtext$file") 
    $New = $newName + $file.Extension

   if($file.Extension -match ".bak")

   {
   Write-Host $file.basename "<--Old Name || New Name -->" $newName
  # Rename-Item $file.FullName -NewName $newName

   }

 }
  
   <# if($file.Name -match "^[w]")
    {
          Rename-Item $file.FullName -NewName "$($New).grb" 
    }
    else
    {
         Rename-Item $file.FullName -NewName $New
    }
    #>

 