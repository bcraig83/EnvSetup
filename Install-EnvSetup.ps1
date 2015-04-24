# Add common functions needed by install
# Load custom functions .\Common\functions
. .\Common\functions\Install-CommonFunctions.ps1

# Install chocolatey
#iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
if( Install-ChocoOnlyIfNotPreviouslyInstalled )
{
	write-host 'All is good...so far!'
}else
{
	write-host 'All is not good...'
	Exit
}
# Ensure tools env variable are set
Set-ChocoToolsVariables

# Install BoxStarter
cinst boxstarter -y

# Remove custom functions .\Common\functions
# as there seem to be issues if functions are loaded multiple times
. .\Common\functions\Remove-CommonFunctions.ps1

write-host '########################'
write-host ' Initial setup complete '
write-host '########################'
