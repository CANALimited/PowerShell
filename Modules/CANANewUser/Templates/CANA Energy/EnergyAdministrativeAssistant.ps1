<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.167
	 Created on:   	08/28/2019 10:13 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyAdministrativeAssistant.ps1.ps1
	===========================================================================
.SYNOPSIS
Adds the user to the groups defined in this function Add-EnergyAdministrativeAssistant

.DESCRIPTION
Adds the user to the groups defined in this function Add-EnergyAdministrativeAssistant
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
		stfa.Energy.Archive.RWED
		stfa.Energy.Engineering.RWED
		tfa.Energy.Administrative.RWED
		tfa.Energy.Drafting.RWED
		tfa.Energy.Procurement.RWED	
		tfa.Energy.ProjectControls.RWED
		tfa.Energy.READ	tfa.Energy.RWED

	
	.EXAMPLE
				PS C:\> Add-EnergyAdministrativeAssistant $Username
	
	.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-EnergyAdministrativeAssistant
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
	$ADGroups.add('Drive J - Business') | Out-Null
	
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Energy - Engineering') | Out-Null
	$ADGroups.add('CANA Energy - Project Services') | Out-Null
	$ADGroups.add('EXCHMBX-HTIDwgCtrl') | Out-Null
	$ADGroups.add('Plotter Access CHV') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP.Energy.Admins') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Admins') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null   #Legacy security groups
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVDrawingManagement.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVDWGScans.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVPanelShop.Read') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVPivot9.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null #Legacy security groups
	$ADGroups.add('tfa.Energy.Administrative.RWED') | Out-Null	#Legacy security groups
	$ADGroups.add('tfa.Shared.RWED') | Out-Null		#Legacy security groups
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	$ADGroups.add('XenApp75_Viewpoint_Prod') | Out-Null
	
	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.RWED') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Drafting.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.ProjectControls.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.RWED') | Out-Null
	
	
	
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