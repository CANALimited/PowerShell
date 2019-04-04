<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 11:23 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyIntern.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyIntern
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyIntern
#>


function Add-EnergyIntern
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		311ProjectManager
		Ace_Sec
		All Head Office Users
		All Users
		CANA FWC Users
		CANA Lunch Special
		CANA Utilities Permits
		CANA Utilities PMs and Interns
		CANA Utilities Tenders
		CANA Utilities Users
		Email Archiving Enabled
		Mbx.Locates
		Plotter Access CUT
		Printer Access RM 207-West Kitchen Area – HP 880Z Default
		Printer Access RMW202A-Mezzanine - Aficio 4504 Default
		SP_CUT_Staff
		SP_Energy_Staff
		stfa.Utilities.Project.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.Utilities.CUTemplates.RWED
		tfa.Utilities.CUWeeklyMeetings.RWED
		tfa.Utilities.Estimate.RWED
		tfa.Utilities.Project.RWED
		tfa.Utilities.Purchasing.RWED
		tfa.Utilities.RWED
		tfa.Utilities.StructureandStandardsManualPlusMaps.RWED
		Vista Viewpoint Users
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyIntern $Username
	
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
	$ADGroups.add('311ProjectManager') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Utilities Permits') | Out-Null
	$ADGroups.add('CANA Utilities PMs and Interns') | Out-Null
	$ADGroups.add('CANA Utilities Tenders') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('Mbx.Locates') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('Printer Access RM 207-West Kitchen Area – HP 880Z Default') | Out-Null
	$ADGroups.add('Printer Access RMW202A-Mezzanine - Aficio 4504 Default') | Out-Null
	$ADGroups.add('SP_CUT_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Utilities.CUTemplates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.CUWeeklyMeetings.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Purchasing.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StructureandStandardsManualPlusMaps.RWED') | Out-Null
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