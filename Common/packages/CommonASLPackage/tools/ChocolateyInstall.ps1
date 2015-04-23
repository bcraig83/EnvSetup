try {
		
	Write-Host "Install Windows OS utilities." -ForegroundColor Yellow
	#cinst virtualclonedrive -y
	#cinst awake -y
	#cinst 7zip -y
	#cinst filezilla -y
	#cinst putty -y
	#cinst sysinternals -y
	#cinst rdcman -y

	Write-Host "Install Windows OS Java and .NET." -ForegroundColor Yellow
	#cinst dotnet4.5 -y
	#cinst dotnet3.5 -y
	#cinst jdk8 -y
	 
	Write-Host "Install Windows OS common programs." -ForegroundColor Yellow
	#cinst notepadplusplus -y
	#cinst vlc -y
	#cinst everything -y
	#cinst skype -y
	#cinst winscp -y
	#cinst windirstat -y
	#cinst greenshot -y
	#cinst teamviewer -y
	#cinst winmerge -y
	Write-Host "Finished installing Windows OS common programs." -ForegroundColor Yellow

    Write-ChocolateySuccess 'CommonASLPackage'
    #Invoke-Reboot

} catch {
  Write-ChocolateyFailure 'CommonASLPackage' $($_.Exception.Message)
  throw
}