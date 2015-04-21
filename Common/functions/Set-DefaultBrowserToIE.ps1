function Set-DefaultBrowserToIE
{
    Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -name ProgId IE.HTTP
    # Rather than waste time figuring out what browser was being used, I'm assuming that people will just switch back themselves the next time they use their browser...
}
