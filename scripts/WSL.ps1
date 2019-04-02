#Referenced heavily from: https://github.com/Microsoft/windows-dev-box-setup-scripts/blob/master/scripts/WSL.ps1

choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx
# run the distro once and have it install locally with root user, unset password

RefreshEnv
Ubuntu install --root
Ubuntu run apt update
Ubuntu run apt upgrade -y