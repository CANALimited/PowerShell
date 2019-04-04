<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 9:57 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyEgineerInter.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyEgineerInter
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyEgineerInter
#>


function Add-EnergyEgineerInter
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All CHV Users
		All Head Office Users
		All Users
		CANA Lunch Special
		CHV Engineering
		Email Archiving Enabled
		GSG.HTI.AllUsers
		GSG.HTI.DrawingManagement.RO
		GSG.HTI.Engineering.RO
		GSG.HTI.Engineering.RW
		GSG.HTI.Shared.RW
		Printer Access RM 207-West Kitchen Area – HP 880Z Secondary
		Printer Access RM225-File Room - Aficio 6004 Default
		SP.All.CHV.R
		SP_CHV_Staff
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.Read
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_Acrobat_Pro_Users
		SW_FWC_Users
		tfa.CHVArchive.Read
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.Read
		tfa.CHVDWGScans.Read
		tfa.CHVEngineering.RWED
		tfa.CHVProjectJobs.JobNumber.Read
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		XenApp75_Bluebeam_Revu12
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyEgineerInter $Username
	
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
	$ADGroups.add('All CHV Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CHV Engineering') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('GSG.HTI.AllUsers') | Out-Null
	$ADGroups.add('GSG.HTI.DrawingManagement.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('Printer Access RM 207-West Kitchen Area – HP 880Z Secondary') | Out-Null
	$ADGroups.add('Printer Access RM225-File Room - Aficio 6004 Default') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_Acrobat_Pro_Users') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.Read') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.Read') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
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