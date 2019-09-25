<#	
	.NOTES
	===========================================================================
	 Created on:   	08/20/2019 7:57 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA
	 Filename:     	Energy-ArchiveProject.ps1
	===========================================================================
	.DESCRIPTION
		This file will ask what folder is to be archived, then robocopy the file in to the Archived folder, and set the permissions to read only.
#>

$ClientName = @(Get-ChildItem \\canagroup.cana-group\business\Energy\Clients | Out-GridView -Title 'Choose a file' -PassThru)
$ProjectName = @(Get-ChildItem \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Active Projects" | Out-GridView -Title 'Choose a file' -PassThru)

Robocopy.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Active Projects"\$ProjectName \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Archived Projects"\$ProjectName /e /move

Write-Verbose "Removing Inheritance from Archived Projects\$ProjectName"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Archived Projects"\$ProjectName /inheritance:r /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to Archived Projects\$ProjectName with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Archived Projects"\$ProjectName /T /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for stfa.Energy.Archive.READ to Archived Projects\$ProjectName with (CI)(OI)(RX)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName\"Archived Projects"\$ProjectName /T /GRANT "stfa.Energy.Archive.READ:(CI)(OI)(RX)"
