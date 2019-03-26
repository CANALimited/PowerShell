<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	03/26/2019 11:02 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	InstallRSAT.ps1
	===========================================================================
	.DESCRIPTION
		This small script will download and install RSAT on Windows 10 1809.
#>

Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
