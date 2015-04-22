# Add common functions needed by install
# Load custom functions .\functions

write-host '###################'
write-host ' Loading functions '
write-host '###################'

$modules = Get-ChildItem .\Common\functions -Filter *.psm1
$modules | ForEach-Object { 
	write-host ' Loading function: ' $_.Name
	import-module -name  $_.FullName 
}

# Install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

Set-ChocoToolsVariables

# Install BoxStarter
cinst boxstarter -y

# Set Default Browser to IE. This is required for running boxstarter packages.
Set-DefaultBrowserToIE

START http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/bcraig83/EnvSetup/master/BasicInstall.txt
