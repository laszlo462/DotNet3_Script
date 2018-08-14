:: Run this script as administrator to install the .NET 3.5 feature on Server 2012 if WSUS policies are preventing contact to Microsoft to pull the source files.
:: Author: Steve Szabo
:: Date: 08/14/2018

powershell -ExecutionPolicy Bypass -Command "Start-Process PowerShell -Verb RunAs -WorkingDirectory %~dp0_scriptFiles -ArgumentList '-file %~dp0_scriptFiles\_InstallDotNet3.ps1'"