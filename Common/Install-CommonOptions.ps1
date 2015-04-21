Update-ExecutionPolicy Unrestricted

# Load custom functions .\functions

write-host '###################'
write-host ' Loading functions '
write-host '###################'

$modules = Get-ChildItem .\functions -Filter *.psm1
$modules | ForEach-Object { 
	write-host ' Loading function: ' $_.Name
	import-module -name  $_.FullName 
}

# Get options in the Common folder
# Options must have ps1 extension
$arr = Get-ChildItem .\Packs -filter "*Pack.ps1" | Foreach-Object {$_.FullName}

# Have list of packs from above so cycle through and ask user which pack need to be installed
# *Pack.ps1 can contain additional logic
For ($i = 0; $i -le $arr.length-1; $i++){
    Write-Host "[" $i "] " $arr[$i]
    $packName = $arr[$packNo]
    & $packName
}

#Finally install windows updates
Install-WindowsUpdate -AcceptEula
