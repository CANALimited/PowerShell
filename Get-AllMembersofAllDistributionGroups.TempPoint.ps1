<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/01/2019 1:28 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$Groups = Get-DistributionGroup
$Groups | ForEach-Object {
	$group = $_.Name
	$members = ''
	Get-DistributionGroupMember $group | ForEach-Object {
		If ($members)
		{
			$members = $members + ";" + $_.Name
		}
		Else
		{
			$members = $_.Name
		}
	}
	New-Object -TypeName PSObject -Property @{
		GroupName = $group
		Members   = $members
	}
} | Export-CSV "C:\TEMP\Distribution-Group-Members.csv" -NoTypeInformation -Encoding UTF8