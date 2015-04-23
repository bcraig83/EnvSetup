try {

	Write-Host "Install Windows OS Browsers and Online staorage." -ForegroundColor Yellow
	cinst firefox -y
	choco install google-chrome-x64 -y
	choco install flashplayerplugin -y

	cinst dropbox -y
	choco install googledrive -y
	
    Write-ChocolateySuccess 'CommonBrowserAndStoragePackage'
} catch {
  Write-ChocolateyFailure 'CommonBrowserAndStoragePackage' $($_.Exception.Message)
  throw
}