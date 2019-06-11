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


Invoke-Command -Computername $FileServer -Credential $AdminCredentials -ScriptBlock {
	param
	(
		$RUserName,
		$RBaseHomeFolderPath,
		$RFileServer
	)
	
	#region Ensure the home folder to create doesn't already exist
	$RhomeFolderPath = "$RBaseHomeFolderPath\$RUserName"
	if (Test-Path -Path $RhomeFolderPath)
	{
		throw "The home folder path [$RhomeFolderPath] already exists."
	}
	Write-debug "Making Home Folder$RhomeFolderPath"
	MKDir $RhomeFolderPath
	
	Write-debug "Disable inheritance and Remove Permission on $RhomeFolderPath"
	ICACLS $RhomeFolderPath /inheritance:r
	# setup basic permissions for all folders.
	
	ICACLS $RhomeFolderPath /Grant "$RFileServer\administrator:(CI)(OI)(F)" /T
	
	MKDir $RhomeFolderPath\"My Documents"
	MKDir $RhomeFolderPath\"My Documents\Scans"
	
	ICACLS $RhomeFolderPath /T /Grant "CANAGROUP\Ricoh:(CI)(OI)(RX)"
	ICACLS $RhomeFolderPath /T /Grant "CANAGROUP\svcHTIscan:(CI)(OI)(RX)"
	ICACLS $RhomeFolderPath /T /Grant "CANAGROUP\Domain Admins:(CI)(OI)(F)"
	ICACLS $RhomeFolderPath\"My Documents\Scans" /T /Grant "CANAGROUP\Ricoh:(CI)(OI)(RX,W,D)"
} -ArgumentList $UserName, $BaseHomeFolderPath, $FileServer