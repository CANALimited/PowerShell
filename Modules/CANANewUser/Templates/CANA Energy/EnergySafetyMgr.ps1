<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 1:38 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergySafetyMgr.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergySafetyMgr 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergySafetyMgr 
#>


function Add-EnergySafetyMgr
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		361POReceiver
		371APReviewer
		Ace_Certificates_Sec
		Ace_Sec
		All CHV Users
		All Head Office Users
		CANA Construction Incident Reports
		CANA Construction iOS Users
		CANA FWC Users
		CANA Lunch Special
		CANA Utilities High Voltage Safety
		CANA Utilities Safety
		CANA Utilities Safety Reports
		CANA Utilities Users
		CHV Incident Notification Reports
		CHV Incident Notification Reports - EMS
		CHV Incident Notification Reports - Near Miss
		Drive K - DFS_Mapping
		Email Archiving Enabled
		Est_Sec
		FWC52TimeKeeper
		Plotter Access CUT
		Print_Basement_Sec
		Printer Access RM407-4th Floor Kitchen Area - Aficio 4503 Sec
		Printer Access RM438Y-Southeast- Ricoh 4504ex Default
		Safety.Utilities.Orientation
		Safety_Sec
		Safety_Sec_Modify
		Salaried Employees
		SP.All.CU.R
		SP.ConstructionCert
		SP.Energy.Safety.Team
		SP.Utilities.Milage
		SP_CUT_Staff                                                 
		SP_EHS_Managers
		SP_EHS_Staff
		SP_Energy_Safety_Staff
		stfa.CANAConstruction.HOSafetyFiling.RWED
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVCommon.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.RWED
		tfa.NotMyselfToday.RWED
		tfa.Safety.InternalReporting.RWED
		tfa.Safety.Read
		tfa.Safety.RWED
		tfa.SafetyHVU.RWED
		tfa.Utilities.ClaimsForPropertyDamage.Read
		tfa.Utilities.EmployeeCertificates.RWED
		tfa.Utilities.EquipmentCertificates.Read
		tfa.Utilities.Estimate.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		Viewpoint Users
		Vista Viewpoint Users
		XenApp75_Bluebeam_Revu12
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergySafetyMgr $Username
	
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
	$ADGroups.add('361POReceiver') | Out-Null
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('Ace_Certificates_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('All CHV Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA Construction Incident Reports') | Out-Null
	$ADGroups.add('CANA Construction iOS Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Utilities High Voltage Safety') | Out-Null
	$ADGroups.add('CANA Utilities Safety') | Out-Null
	$ADGroups.add('CANA Utilities Safety Reports') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - EMS') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('Drive K - DFS_Mapping') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('Est_Sec') | Out-Null
	$ADGroups.add('FWC52TimeKeeper') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('Print_Basement_Sec') | Out-Null
	$ADGroups.add('Printer Access RM407-4th Floor Kitchen Area - Aficio 4503 Sec') | Out-Null
	$ADGroups.add('Printer Access RM438Y-Southeast- Ricoh 4504ex Default') | Out-Null
	$ADGroups.add('Safety.Utilities.Orientation') | Out-Null
	$ADGroups.add('Safety_Sec') | Out-Null
	$ADGroups.add('Safety_Sec_Modify') | Out-Null
	$ADGroups.add('Salaried Employees') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.ConstructionCert') | Out-Null
	$ADGroups.add('SP.Energy.Safety.Team') | Out-Null
	$ADGroups.add('SP.Utilities.Milage') | Out-Null
	$ADGroups.add('SP_CUT_Staff') | Out-Null
	$ADGroups.add('SP_EHS_Managers') | Out-Null
	$ADGroups.add('SP_EHS_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Safety_Staff') | Out-Null
	$ADGroups.add('stfa.CANAConstruction.HOSafetyFiling.RWED') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.NotMyselfToday.RWED') | Out-Null
	$ADGroups.add('tfa.Safety.InternalReporting.RWED') | Out-Null
	$ADGroups.add('tfa.Safety.Read') | Out-Null
	$ADGroups.add('tfa.Safety.RWED') | Out-Null
	$ADGroups.add('tfa.SafetyHVU.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ClaimsForPropertyDamage.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Bluebeam_Revu12') | Out-Null
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