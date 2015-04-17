function Set-DefaultBrowserToIE
{
    Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -name ProgId IE.HTTP
    # Rather than waste time figuring out what browser was being used, I'm assuming that people will just switch back themselves the next time they use their browser...
}

# Install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Install BoxStarter
cinst boxstarter -y

# Set Default Browser to IE. This is required for running boxstarter packages.
Set-DefaultBrowserToIE

START http://boxstarter.org/package/nr/url?

