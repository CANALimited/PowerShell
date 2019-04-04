<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 1:48 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergySupervisorFiber.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergySupervisorFiber 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergySupervisorFiber 
#>


function Add-EnergySupervisorFiber
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		371APReviewer
		Ace_EmpCerts_R_Sec
		Ace_EquipCerts_R_Sec
		Ace_Forms_Sec
		Ace_Sec
		ACE_WklyMgrMtgs_Sec
		AceShop_Sec
		All Head Office Users
		CANA FWC Users
		CANA Utilities Field Mgrs & Supervisors
		CANA Utilities iOS Users
		CANA Utilities Users
		CANA Utilities Yard Sign-in
		CHV Incident Notification Reports
		Email Archiving Enabled
		FWC52Approvers
		Plotter Access CUT
		SP.All.CU.R
		SP.Utilities.Milage
		SP.UtilitiesCert
		SP_CUT_Managers
		SP_Energy_Supervisors
		SP_Managers_All
		stfa.Utilities.Project.02RegulatoryExternalAgencies.RWED
		stfa.Utilities.Project.07Drawings.RWED
		stfa.Utilities.Project.08Construction.RWED
		stfa.Utilities.Project.09TestingCommissioning.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVDWGScans.RWED
		tfa.Utilities.Crew&ProjectResources.Read
		tfa.Utilities.Divisions.RWED
		tfa.Utilities.EmployeeCertificates.Read
		tfa.Utilities.EmployeeFieldAssessment.Read
		tfa.Utilities.EquipmentCertificates.Read
		tfa.Utilities.Estimate.RWED
		tfa.Utilities.Project.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		tfa.Utilities.StructureandStandardsManualPlusMaps.Read
		tfa.Utilities.Training.Read
		Viewpoint Users
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		XenApp75_Adobe_Acrobat_Standard
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergySupervisorFiber $Username
	
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
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('Ace_EmpCerts_R_Sec') | Out-Null
	$ADGroups.add('Ace_EquipCerts_R_Sec') | Out-Null
	$ADGroups.add('Ace_Forms_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('ACE_WklyMgrMtgs_Sec') | Out-Null
	$ADGroups.add('AceShop_Sec') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Utilities Field Mgrs & Supervisors') | Out-Null
	$ADGroups.add('CANA Utilities iOS Users') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CANA Utilities Yard Sign-in') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('FWC52Approvers') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.Utilities.Milage') | Out-Null
	$ADGroups.add('SP.UtilitiesCert') | Out-Null
	$ADGroups.add('SP_CUT_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Supervisors') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.02RegulatoryExternalAgencies.RWED') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.07Drawings.RWED') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.08Construction.RWED') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.09TestingCommissioning.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Crew&ProjectResources.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Divisions.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeFieldAssessment.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StructureandStandardsManualPlusMaps.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Training.Read') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Adobe_Acrobat_Standard') | Out-Null
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