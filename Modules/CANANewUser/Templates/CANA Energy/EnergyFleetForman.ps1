<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 11:05 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyFleetForman.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyFleetForman
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyFleetForman
#>


function Add-EnergyFleetForman
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		181AccountingAssistant
		331Purchaser
		341Inventory
		361POReceiver
		371APReviewer
		Ace_Certificates_Sec
		Ace_DR_R_Sec
		Ace_Sec
		AceShop_Sec
		All Head Office Users
		CANA Construction iOS Users
		CANA Equipment Management
		CANA FWC Users
		CANA Lunch Special
		CANA Utilities Equipment
		CANA Utilities Field Mgrs & Supervisors
		CANA Utilities Fleet
		CANA Utilities Fleet Repairs
		CANA Utilities Users
		CHV Incident Notification Reports
		Email Archiving Enabled
		FWC52TimeKeeper
		Plotter Access CUT
		Printer Access RM108-Shipping - Aficio 5001 Default
		Salaried Employees
		SP.All.CU.R
		SP.Equipment.Read
		SP_CUT_Staff
		SP_Energy_Foremen
		SP_Fleet_Staff
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.Utilities.EmployeeCertificates.Read
		tfa.Utilities.EquipmentCertificates.RWED
		tfa.Utilities.Material&Equipment.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		Viewpoint Users
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyFleetForman $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>	
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)]
		[string]$Username
	)
	Write-Debug "The username is $Username"
	Write-Debug "Creating empty array"
	$ADGroups = [System.Collections.ArrayList]@()
	
	Write-Debug "Adding groups to the Array"
	Write-Verbose "Adding groups to the Array"
	
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('181AccountingAssistant') | Out-Null
	$ADGroups.add('331Purchaser') | Out-Null
	$ADGroups.add('341Inventory') | Out-Null
	$ADGroups.add('361POReceiver') | Out-Null
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('Ace_Certificates_Sec') | Out-Null
	$ADGroups.add('Ace_DR_R_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('AceShop_Sec') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA Construction iOS Users') | Out-Null
	$ADGroups.add('CANA Equipment Management') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Utilities Equipment') | Out-Null
	$ADGroups.add('CANA Utilities Field Mgrs & Supervisors') | Out-Null
	$ADGroups.add('CANA Utilities Fleet') | Out-Null
	$ADGroups.add('CANA Utilities Fleet Repairs') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('FWC52TimeKeeper') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('Printer Access RM108-Shipping - Aficio 5001 Default') | Out-Null
	$ADGroups.add('Salaried Employees') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.Equipment.Read') | Out-Null
	$ADGroups.add('SP_CUT_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Foremen') | Out-Null
	$ADGroups.add('SP_Fleet_Staff') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Material&Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	$ADGroups.add('XenApp75_Viewpoint_Prod') | Out-Null
	
	
	Write-Debug "Array contains $ADGroups"
	Write-Verbose "Added list of groups to array"
	
	Write-Debug "Starting Foreach"
	foreach ($ADGroup in $ADGroups)
	{
		Add-ADGroupMember -Identity $ADGroup -Members $Username
		Write-Debug "Adding $Username to the group $ADGroup"
		Write-Verbose "Adding $Username to the group $ADGroup"
	}
	
}