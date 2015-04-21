function Install-ChocoOnlyIfNotPreviouslyInstalled 
{
  #Is chocolatey installed
  $chocoInstalled = &choco
  $chocoInstalled = ($chocoinstalled.Split(" "))[0]

  if ($chocoInstalled -ne 'Chocolatey') {

    write-host 'Choco not installed. Downloading and Installing now....'

    Set-DefaultBrowserToIE

    # Install chocolatey
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

    # Set the environment variable for the bin root to a default value if not already set #
    Set-ChocoToolsVariables
       
    return $true
  }else{
    write-host 'chocolatey already installed'
    return $true
  }
  return $false
}