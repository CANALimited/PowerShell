<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 9:42 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyEngineer.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyEngineer
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyEngineer
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		CANA Energy Users
		All Head Office Users
		All Users
		CANA FWC Users
		CANA Energy - Engineering
		Email Archiving Enabled
		
		Printer Access RM 207-West Kitchen Area – HP 880Z Secondary
		Printer Access RM225-File Room - Aficio 6004 Default
		SP_CHV_Staff
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVArchive.RWED
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.Read
		tfa.CHVEngineering.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.RWED
		Viewpoint Users
		Vista Viewpoint Users
		XenApp75_Users
	
	.EXAMPLE
				PS C:\> Add-EnergyEngineer $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-EnergyEngineer
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
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Energy - Engineering') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('FWC52Approvers') | Out-Null
	$ADGroups.add('Mbx.Locates') | Out-Null
	$ADGroups.add('Plotter Access CHV') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.Read') | Out-Null
	$ADGroups.add('tfa.CHVManual.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.CUWeeklyMeetings.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.LessonsLearned.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ProjectSummaries&References.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Purchasing.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StructureandStandardsManualPlusMaps.RWED') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('XenApp75_Viewpoint_Prod') | Out-Null
	$ADGroups.add('SW_Firebird_Database') | Out-Null
	

	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.RWED') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.Read') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	
	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Drafting.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.READ') | Out-Null
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