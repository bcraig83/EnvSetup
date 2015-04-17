# Install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Install BoxStarter
cinst boxstarter -y

# Open BoxStarter Shell
BoxstarterShell