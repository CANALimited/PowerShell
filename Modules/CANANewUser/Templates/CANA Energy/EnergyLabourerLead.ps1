<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 11:27 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyLabourerLead.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyLabourer
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyLabourer
#>


function Add-EnergyLabourerLead
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		CANA Utilities Field Foremen
		CANA Utilities iOS Users
		CANA Utilities Users
		FWC52TimeKeeper
		Plotter Access CUT
		SP.All.CU.R
		SP.Utilities.Milage
		SP_CUT_Staff
		SP_Energy_Foremen
		SW_FWC_Users
		XenApp75_Users
	
	.EXAMPLE
				PS C:\> Add-EnergyLabourer $Username
	
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
	$ADGroups.add('SP_Energy_Staff') | Out-Null

	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
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