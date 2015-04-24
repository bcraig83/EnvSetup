
write-host '########################'
write-host ' Install chocolatey and boxstarter '
write-host '########################'

# Rather than waste time figuring out what browser was being used, I'm assuming that people will just switch back themselves the next time they use their browser...
Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -name ProgId IE.HTTP

# Install chocolatey
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Install BoxStarter
cinst boxstarter -y

write-host '########################'
write-host ' Initial setup complete '
write-host '########################'
