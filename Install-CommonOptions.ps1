#Load Boxstarter.Chocolatey
Import-Module Boxstarter.Chocolatey

Update-ExecutionPolicy Unrestricted

# Load custom functions .\Common\functions
. .\Common\functions\Install-CommonFunctions.ps1
	
write-host $pwd	
# Get options in the Common folder
# Options must have ps1 extension
#$arr = Get-ChildItem .\Common\packages -filter "*.nupkg" | Foreach-Object {$_.FullName}

$arr = Get-ChildItem .\Common\packages\* -Include *.nupkg, *.ps1

write-host $arr.length ' Packages found'
# Have list of packs from above so cycle through and ask user which pack need to be installed

For ($i = 0; $i -le $arr.length-1; $i++){
    Write-Host "[" $i "] " $arr[$i]
    $packName = $arr[$i]	

	#if (Install-NeededFor $packageInstallText) 
	if (Install-NeededFor $packName) 
	{
		write-host 'Installing ' + $packName
		#Use this to install a boxstarter package
	    
		if($packName -like '*.nupkg')
		{
			Write-Host 'Here in .nupkg'
	    	#Install-BoxstarterPackage -PackageName $packName
		}elseif($packName -like '*.ps1')
		{
			Write-Host 'Here in .ps1'
			#Use this to call a script
			#& $packName
		}
		
	}else
	{
		write-host 'Cancelling Install of ' $packName
	}
}

#Finally install windows updates
if (Install-NeededFor 'Windows Updates') 
{
	If ( ! (Get-module Boxstarter.Chocolatey )) {

		#Load Boxstarter.Chocolatey
		Import-Module Boxstarter.Chocolatey
	}
	#Finally install windows updates
	Install-WindowsUpdate -AcceptEula

}else
{
  write-host 'Windows Updates not installed'
}

# Clean up after script
Remove-Module Boxstarter*

# Remove custom functions .\Common\functions
# as there seem to be issues if functions are loaded multiple times
. .\Common\functions\Remove-CommonFunctions.ps1
