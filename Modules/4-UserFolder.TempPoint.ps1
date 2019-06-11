<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.163
	 Created on:   	06/04/2019 1:00 PM
	 Created by:   	admjustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$AdminCredentials = Get-Credential -Message "Credential are required for access the Domain Controller, File server and Exchange server"
$UserName = Read-Host "Enter the Username of the User"
$FileServer = "vCANAFile-01"
$BaseHomeFolderPath = '\\canagroup.cana-group\HomeDrive\Users'

$session = New-PSSession -ComputerName $FileServer -Credential $AdminCredentials
$homeFolderPath = "$BaseHomeFolderPath\$UserName"
Invoke-Command $session -Scriptblock { ICACLS "$homeFolderPath" /T /Grant "$($UserName):(CI)(OI)(F)" }
#Import-PSSession -Session $session -DisableNameChecking

#& ICACLS $homeFolderPath /T /Grant $UserName":(CI)(OI)(F)"
Write-Debug -Message "Granting folder permissions to canagroup\$Username to $homeFolderPath"

Remove-PSSession $Session