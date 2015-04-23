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

# Set Default Browser to IE. This is required for running boxstarter packages.
Set-DefaultBrowserToIE

#Call boxstarter so that you can enter OS password for your account
boxstarter

# Remove custom functions .\Common\functions
# as there seem to be issues if functions are loaded multiple times
. .\Common\functions\Remove-CommonFunctions.ps1

write-host '########################'
write-host ' Initial setup complete '
write-host '########################'

#START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/bcraig83/EnvSetup/master/BasicInstall.txt
# Disable-UAC

$message  = 'We are now going to install some common windows features and tools. You will be asked to accept or reject specific installation packages'
$question = 'Are you sure you want to proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  Write-Host 'confirmed'
  & .\Install-CommonOptions.ps1
} else {
  Write-Host 'Cancelled'
}

$message  = 'We are now going to install some ASL project specific tools. You will be asked to accept or reject specific installation packages'
$question = 'Are you sure you want to proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  Write-Host 'Confirmed'
  & .\Install-ProjectApps.ps1
} else {
  Write-Host 'Cancelled'
}
