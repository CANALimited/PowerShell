<#	
	.NOTES
	===========================================================================
	 Created on:   	08/20/2019 7:49 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA
	 Filename:     	Energy-DeleteTempFolder180.ps1
	===========================================================================
	.DESCRIPTION
		This file should be run as a schedualed task to delete content from the temporary directory when a file reaches 180 days old.
#>

Get-ChildItem -Path "R:\Energy-MP\Energy-Shared\Temporary" -Recurse | Where-Object { ($_.LastWriteTime -lt (Get-Date).AddDays(-180)) } | Remove-Item
