<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 11:52 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyPLTGeneralForeman.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyPLTGeneralForeman 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyPLTGeneralForeman 
#>


function Add-EnergyPLTGeneralForeman
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		CANA Utilities Field Foremen
		CANA Utilities Field Mgrs & Supervisors
		CANA Utilities Incident Reports
		CANA Utilities iOS Users
		CANA Utilities Yard Sign-in
		CU Safety Committee
		FWC52TimeKeeper
		SP.All.CU.R
		SP_CUT_Managers
		SP_Energy_Foremen
		SP_Managers_All
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.Utilities.Crew&ProjectResources.Read
		Vista Viewpoint Users
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyPLTGeneralForeman $Username
	
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
	$ADGroups.add('CANA Utilities Field Foremen') | Out-Null
	$ADGroups.add('CANA Utilities Field Mgrs & Supervisors') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Utilities iOS Users') | Out-Null
	$ADGroups.add('CANA Utilities Yard Sign-in') | Out-Null
	$ADGroups.add('CU Safety Committee') | Out-Null
	$ADGroups.add('FWC52TimeKeeper') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP_CUT_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Foremen') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Utilities.Crew&ProjectResources.Read') | Out-Null
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