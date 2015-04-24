#NOTE The below do not get the correct location 
# They get base directory name from which this script was called
#$projectPackage = $(Get-Location | Split-Path -Leaf)
#$packageInstallText = $projectPackage + ' software package'

#Full path
#$projectPackage = Split-Path $script:MyInvocation.MyCommand.Path
$projectPackage = Split-Path $script:MyInvocation.MyCommand.Path | Split-Path -Leaf

if (Install-NeededFor $packageInstallText) 
{
	#Check if chocolatey is installed 
	if( Install-ChocoOnlyIfNotPreviouslyInstalled )
	{
		write-host 'Installing ' + $packageInstallText
		# Could call other install scrtips here or call cinst package
  		#& another.ps1
  		#cinst packages.config -y
	}else
	{
		write-host 'We have encountered a problem installing Chocolatey'
	}
  
}else
{
  write-host 'Installation cancelled'
}