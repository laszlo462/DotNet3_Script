# Powershell script launched via InstallDotNet3.bat file
# Author: Steve Szabo
# Date: 08/14/2018

#
Write-Host "Installing 7-zip..." -ForegroundColor Green
Start-Process msiexec.exe -ArgumentList '/i 7z1805-x64.msi /qn' -Wait -NoNewWindow
Set-Alias 7z "C:\Program Files\7-Zip\7z.exe"
Write-Host "`n"
Write-Host "Extracting Server 2012 sxs source files..." -ForegroundColor Green
7z x .\sxs.zip -y
$sxsPath = $PWD.Path + "\sxs"

Write-Host "`n"
Write-Host "Enabling .NET 3.5 features..." -ForegroundColor Green
Enable-WindowsOptionalFeature -Online -FeatureName "NetFx3" -All -Source "$sxsPath" -LimitAccess

Write-Host "`n"
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
Write-Host "Complete.  If any errors occured, you may try installation via the Add Features GUI and adding the source sxs directory, found here:"
Write-Host $sxsPath -ForegroundColor Yellow
Write-Host "`n"
Read-Host "Press enter to close this window"
exit