Enable-UAC
  Enable-MicrosoftUpdate
  Install-WindowsUpdate -acceptEula 

  # clean up the cache directory
  Remove-Item $cache -Recurse

  # Remove desktop.ini files
  Get-ChildItem -Path (Join-Path ${Env:UserProfile} "Desktop") -Hidden -Filter "desktop.ini" -Force | foreach {$_.Delete()}
  Get-ChildItem -Path (Join-Path ${Env:Public} "Desktop") -Hidden -Filter "desktop.ini" -Force | foreach {$_.Delete()}