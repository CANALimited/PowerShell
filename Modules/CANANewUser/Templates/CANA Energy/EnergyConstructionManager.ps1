<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.167
	 Created on:   	08/28/2019 10:13 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyConstructionManager.ps1
	===========================================================================
.SYNOPSIS
Adds the user to the groups defined in this function EnergyConstructionManager

.DESCRIPTION
Adds the user to the groups defined in this function EnergyConstructionManager
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		CANA Energy Users
		All Head Office Users
		All Users
		Email Archiving Enabled
		
		rfa.Energy
		stfa.Energy.Archive.READ
		stfa.Energy.Archive.RWED
		stfa.Energy.CIP.READ
		stfa.Energy.CIP.RWED
		stfa.Energy.Engineering.READ
		stfa.Energy.Engineering.RWED
		stfa.Energy.Regulatory.READ
		stfa.Energy.Regulatory.RWED
		tfa.Energy.Administrative.READ
		tfa.Energy.Administrative.RWED
		tfa.Energy.BusnessDevelopment.READ
		tfa.Energy.BusnessDevelopment.RWED
		tfa.Energy.Drafting.READ
		tfa.Energy.Drafting.RWED
		tfa.Energy.Management.READ
		tfa.Energy.Management.RWED
		tfa.Energy.Procurement.READ
		tfa.Energy.Procurement.RWED	
		tfa.Energy.ProjectControls.READ
		tfa.Energy.ProjectControls.RWED
		tfa.Energy.READ	tfa.Energy.RWED

	
	.EXAMPLE
				PS C:\> Add-EnergyCADDDesigner $Username
	
	.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-EnergyCADDDesigner
{
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
	
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	
	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Regulatory.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.ProjectControls.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.READ') | Out-Null
	
	$ADGroups.add('All Manager Services Users-1-813325514') | Out-Null
	$ADGroups.add('CANA Energy - Infrastructure') | Out-Null
	$ADGroups.add('CANA Energy Approved Drivers') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Utilities Safety Reports') | Out-Null
	$ADGroups.add('CANA Utilities Yard Sign-in') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('FWC52Approvers') | Out-Null
	$ADGroups.add('Plotter Access CHV') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('Safety_Sec') | Out-Null
	$ADGroups.add('SP KnowMatrix Notice CU') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.Energy.Construction.Managers') | Out-Null
	$ADGroups.add('SP.Roaming.Approvals') | Out-Null
	$ADGroups.add('SP.Utilities.Milage') | Out-Null
	$ADGroups.add('SP.UtilitiesCert') | Out-Null
	$ADGroups.add('SP_CUT_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Management') | Out-Null
	$ADGroups.add('SP_Energy_VIPs') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Project_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Shared.CHVCUSharedFolder.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Administration.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ClaimsForPropertyDamage.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Crew&ProjectResources.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.CUWeeklyMeetings.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Divisions.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeFieldAssessment.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.FortMacMurrayFiles.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.LessonsLearned.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Management.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Material&Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.2012.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ProjectSummaries&References.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Proposals.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Purchasing.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.SeniorManagement.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StrategySessions.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StructureandStandardsManualPlusMaps.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Training.RWED') | Out-Null
	$ADGroups.add('tfa.UtilitiesDR.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('Xenapp75_Project2016') | Out-Null
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