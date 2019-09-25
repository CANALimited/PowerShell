<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 1:22 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyPSEForeman.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyPSEForeman 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyPSEForeman 
#>


function Add-EnergyPSEForeman
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		CANA Energy Users
		CANA FWC Users
		CANA High Voltage Commisioning Authors
		CANA High Voltage iOS Users
		EXCH_PF_CHV_Calendar_Author
		SP_CHV_Staff
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		tfa.CHVCommon.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.RWED
		XenApp75_Users
	
	.EXAMPLE
				PS C:\> Add-EnergyPSEForeman $Username
	
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
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA High Voltage Commisioning Authors') | Out-Null
	$ADGroups.add('CANA High Voltage iOS Users') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Author') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	
	
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