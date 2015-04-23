function Install-ChocoOnlyIfNotPreviouslyInstalled 
{
  write-host ' *Install-ChocoOnlyIfNotPreviouslyInstalled* '
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

function Set-DefaultBrowserToIE
{
	Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -name ProgId IE.HTTP
	# Rather than waste time figuring out what browser was being used, I'm assuming that people will just switch back themselves the next time they use their browser...
}
	
function Set-ChocoToolsVariables
{
  # Set the environment variable for the bin root to a default value if not already set 
  # NOTE: There seems to be a bug with chocolatey since the upgrade to v0.9
  #       Ensure that chocolatey_bin_root & ChocolateyBinRoot are the same
  #       By default it should be \tools do not preappend with drive letter
 
  if($env:chocolatey_bin_root -eq $null){[Environment]::SetEnvironmentVariable("chocolatey_bin_root", "\tools", "User")}
  if($env:ChocolateyBinRoot -eq $null){[Environment]::SetEnvironmentVariable("ChocolateyBinRoot", "\tools", "User")}
}

function Install-NeededFor 
{
  param([string]$packageName = '')
  if ($packageName -eq '') {return $false}

  $yes = '6'
  $no = '7'
  $msgBoxTimeout='-1'

  $answer = $msgBoxTimeout
  try {
    $timeout = 10
    $question = "Do you want to install $($packageName)? Defaults to 'Yes' after $timeout seconds"
    $msgBox = New-Object -ComObject WScript.Shell
    $answer = $msgBox.Popup($question, $timeout, "Install $packageName", 0x4)
  }
  catch {
  }

  if ($answer -eq $yes -or $answer -eq $msgBoxTimeout) {
    write-host 'returning true'
    return $true
  }
  return $false
}