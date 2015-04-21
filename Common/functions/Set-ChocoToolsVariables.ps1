function Set-ChocoToolsVariables
{
  # Set the environment variable for the bin root to a default value if not already set 
  # NOTE: There seems to be a bug with chocolatey since the upgrade to v0.9
  #       Ensure that chocolatey_bin_root & ChocolateyBinRoot are the same
  #       By default it should be \tools do not preappend with drive letter
 
  if($env:chocolatey_bin_root -eq $null){[Environment]::SetEnvironmentVariable("chocolatey_bin_root", "\tools", "User")}
  if($env:ChocolateyBinRoot -eq $null){[Environment]::SetEnvironmentVariable("ChocolateyBinRoot", "\tools", "User")}
}