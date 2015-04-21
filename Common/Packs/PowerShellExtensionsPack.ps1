if (Test-Path $profile)
{
	write-host 'profile already exists. You can manually copy'
	write-host 'entries from Microsoft.PowerShell_profile.ps1.'
}else{
	#New-Item -path $profile -type file –force
	write-host 'Create default profile'
	$destination = $profile
	$pathTo = .\Microsoft.PowerShell_profile.ps1
	Copy-Item -Path $pathTo -Destination $destination
}

#Get project directory name
$projectPackage = $(Get-Location | Split-Path -Leaf)
$packageInstallText = $projectPackage + ' software package'

if (Install-NeededFor $packageInstallText) 
{
	#Check if chocolatey is installed 
	if( Install-ChocoOnlyIfNotPreviouslyInstalled )
	{
		write-host 'Installing ' + $packageInstallText
		# Could call other install scrtips here or call cinst package
  		#& another.ps1
  		#cinst packages.config -y

#choco install pscx -y
#choco install nugetpackageexplorer -y

	}else
	{
		write-host 'We have encountered a problem installing Chocolatey'
	}
  
}else
{
  write-host 'Installation cancelled'
}
