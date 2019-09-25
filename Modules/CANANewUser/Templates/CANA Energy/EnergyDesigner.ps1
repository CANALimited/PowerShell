<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/02/2019 1:23 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	designer.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-Designer
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-Designer
#>


function Add-Designer
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		CANA Energy Users
		All Head Office Users
		All Users
		
		CANA Energy - Engineering
		CHV Incident Notification Reports
		CHV Incident Notification Reports - Near Miss
		Email Archiving Enabled
		FWC55TimeKeeper
		
		GSG.HTI.DrawingManagement.RO
		GSG.HTI.Engineering.RO
		GSG.HTI.Engineering.RW
		GSG.HTI.Shared.RW
		GSG.HTI.TestingCommissioning.RW
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
		tfa.CHVTestingAndCommissioning.RWED
		XenApp75_Users
	
	.EXAMPLE
				PS C:\> Add-Designer $Username
	
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
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	
	$ADGroups.add('CANA Energy - Engineering') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('FWC52TimeKeeper') | Out-Null
	$ADGroups.add('Plotter Access CHV') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.RWED') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.CHVTestingAndCommissioning.RWED') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	$ADGroups.add('Drive J - Business') | Out-Null
	
	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Drafting.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.ProjectControls.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.READ') | Out-Null
	
	
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