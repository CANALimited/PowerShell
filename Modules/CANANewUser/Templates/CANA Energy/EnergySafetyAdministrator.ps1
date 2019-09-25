<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 1:32 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergySafetyAdmin.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergySafetyAdmin 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergySafetyAdmin 
#>


function Add-EnergySafetyAdmin
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		321ProjectAdministrator
		Ace_Certificates_Sec
		Ace_DR_Sec
		Ace_Sec
		CANA Energy Users
		All Head Office Users
		CANA FWC Users
		
		CANA Utilities Field Foremen
		CANA Utilities High Voltage Safety
		CANA Utilities Incident Reports
		CANA Utilities Safety
		CANA Utilities Safety Reports
		CANA Utilities Users
		CANA Energy - Engineering
		CHV Incident Notification Reports
		CHV Incident Notification Reports - EMS
		CHV Incident Notification Reports - Near Miss
		CU Safety Committee
		Email Archiving Enabled
		EXCH_PF_CHV_Calendar_Author
		FWC52TimeKeeper
		FWC55TimeKeeper
		
		Print_Basement_Sec
		Safety.Utilities.Orientation
		Safety_Sec
		Safety_Sec_Modify
		Salaried Employees
		SP.All.CU.R
		SP.ConstructionCert
		SP_CUT_Staff
		SP_Energy_Safety_Staff
		SP_Safety_Staff
		Stampede RSVP
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVArchive.Read
		tfa.CHVCommon.RWED
		tfa.CHVProjectJobs.Read
		tfa.Safety.RWED
		tfa.SafetyHVU.RWED
		tfa.Utilities.ClaimsForPropertyDamage.Read
		tfa.Utilities.Crew&ProjectResources.RWED
		tfa.Utilities.EmployeeCertificates.RWED
		tfa.Utilities.EquipmentCertificates.Read
		tfa.Utilities.Project.Estimate.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		Viewpoint Users
		Vista Viewpoint Users
		XenApp_BO
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergySafetyAdmin $Username
	
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
	$ADGroups.add('321ProjectAdministrator') | Out-Null
	$ADGroups.add('Ace_Certificates_Sec') | Out-Null
	$ADGroups.add('Ace_DR_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	
	$ADGroups.add('CANA Utilities Field Foremen') | Out-Null
	$ADGroups.add('CANA Utilities High Voltage Safety') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Utilities Safety') | Out-Null
	$ADGroups.add('CANA Utilities Safety Reports') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CANA Energy - Engineering') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - EMS') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('CU Safety Committee') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Author') | Out-Null
	$ADGroups.add('FWC52TimeKeeper') | Out-Null
	$ADGroups.add('FWC55TimeKeeper') | Out-Null
	
	$ADGroups.add('Print_Basement_Sec') | Out-Null
	$ADGroups.add('Safety.Utilities.Orientation') | Out-Null
	$ADGroups.add('Safety_Sec') | Out-Null
	$ADGroups.add('Safety_Sec_Modify') | Out-Null
	$ADGroups.add('Salaried Employees') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.ConstructionCert') | Out-Null
	$ADGroups.add('SP_CUT_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Safety_Staff') | Out-Null
	$ADGroups.add('SP_Safety_Staff') | Out-Null
	$ADGroups.add('Stampede RSVP') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.Safety.RWED') | Out-Null
	$ADGroups.add('tfa.SafetyHVU.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ClaimsForPropertyDamage.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Crew&ProjectResources.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp_BO') | Out-Null
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