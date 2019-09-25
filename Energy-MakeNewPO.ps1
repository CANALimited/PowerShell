<#	
	.NOTES
	===========================================================================
	 Created on:   	09/17/2019 10:21 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA
	 Filename:     	Energy-MakeNewPO.ps1
	===========================================================================
	.DESCRIPTION
		This file will setup a project folder in the requested Client directory.
#>

$ClientName = @(Get-ChildItem \\canagroup.cana-group\business\Energy\Clients | Out-GridView -Title 'Choose a file' -PassThru)
$ProjectName = @(Get-ChildItem $ClientName\"Active Project"\ | Out-GridView -Title 'Choose a file' -PassThru)
$RFQName = Read-host -message "Please enter the RFQ name"


