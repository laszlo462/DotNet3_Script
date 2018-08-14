# Powershell script launched via InstallDotNet3.bat file
# Author: Steve Szabo
# Date: 08/14/2018

#
Write-Host "Installing 7-zip..."
Start-Process "msiexec.exe" -ArgumentList "/i /qn" -Wait
Set-Alias 7z "C:\Program Files\7-Zip\7z.exe"
Write-Host "`n"
Write-Host "Extracting Server 2012 sxs source files..."
7z x .\sxs.zip
$sxsPath = $PWD.Path + "\sxs"

Write-Host "`n"
Write-Host "Enabling .NET 3.5 features..."
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -Source "$sxsPath" -LimitAccess

Write-Host "`n"
Write-Host "Complete.  If any errors occured, you may try installation via the Add Features GUI and adding the source sxs directory, found here:"
Write-Host $PWD.Path -ForegroundColor Yellow
Write-Host "`n"
Read-Host "Press enter to close this window"
exit