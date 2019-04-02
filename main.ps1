# Description: Testing Boxstarter
# Author: Kyle Baker
# For: Aquaveo
# Referencing heavily from: https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/dev_app_desktop_.NET.ps1

Disable-MicrosoftUpdate

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting Up Windows ---

executeScript "SystemConfiguration.ps1";
executeScript "Browsers.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "WSL.ps1";

#--- reenabling critial items ---

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }
Set-ExecutionPolicy Unrestricted -Force