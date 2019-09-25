<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/02/2019 11:29 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	Commissioning-Technologist-Jr.ps1
	===========================================================================
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-CommissioningTechnologistJr
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-CommissioningTechnologistJr
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		CANA Energy Users
		All Head Office Users
		All Users
		CANA High Voltage Commisioning Owners
		CHV Incident Notification Reports
		CHV Incident Notification Reports - Near Miss
		Email Archiving Enabled
		EXCH_PF_CHV_Calendar_Author
		FWC55TimeKeeper
		
		GSG.HTI.Shared.RW
		GSG.HTI.TestingCommissioning.RW
		HV Safety Committee Group
		Printer Access RMW202A-Mezzanine - Aficio 4504 Default
		SP.All.CHV.R
		SP_CHV_Staff
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		tfa.CHVArchive.Read
		tfa.CHVCommon.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		tfa.CHVTestingAndCommissioning.RWED
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-CommissioningTechnologistJr $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-CommissioningTechnologistJr
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
	
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA High Voltage Commisioning Owners') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Author') | Out-Null
	$ADGroups.add('FWC55TimeKeeper') | Out-Null
	
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('GSG.HTI.TestingCommissioning.RW') | Out-Null
	$ADGroups.add('HV Safety Committee Group') | Out-Null
	$ADGroups.add('Printer Access RMW202A-Mezzanine - Aficio 4504 Default') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.CHVTestingAndCommissioning.RWED') | Out-Null
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