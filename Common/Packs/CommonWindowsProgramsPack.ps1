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
  		#
  		
Write-Host "Install Windows OS utilities." -ForegroundColor Yellow
choco install virtualclonedrive -y
choco install awake -y
cinst 7zip -y
cinst filezilla -y
cinst putty -y
cinst sysinternals -y
choco install rdcman -y

Write-Host "Install Windows OS Java & .NET." -ForegroundColor Yellow
cinst dotnet4.5 -y
choco install dotnet3.5 -y
choco install jdk8 -y
 
Write-Host "Install Windows OS common programs." -ForegroundColor Yellow
cinst notepadplusplus -y
choco install vlc -y
choco install everything -y
cinst skype -y
cinst winscp -y
choco install windirstat -y
choco install greenshot -y
choco install teamviewer -y
choco install winmerge -y
Write-Host "Finished installing Windows OS common programs." -ForegroundColor Yellow

	}else
	{
		write-host 'We have encountered a problem installing Chocolatey'
	}
  
}else
{
  write-host 'Installation cancelled'
}