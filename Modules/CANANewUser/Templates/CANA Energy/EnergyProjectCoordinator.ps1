<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.167
	 Created on:   	08/28/2019 10:13 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyProjectCoordinator.ps1
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
		stfa.Energy.Archive.READ
		stfa.Energy.Archive.RWED
		stfa.Energy.CIP.READ
		stfa.Energy.CIP.RWED
		stfa.Energy.Engineering.READ
		stfa.Energy.Engineering.RWED
		stfa.Energy.Regulatory.READ
		stfa.Energy.Regulatory.RWED
		tfa.Energy.Administrative.READ
		tfa.Energy.Administrative.RWED
		tfa.Energy.BusnessDevelopment.READ
		tfa.Energy.BusnessDevelopment.RWED
		tfa.Energy.Drafting.READ
		tfa.Energy.Drafting.RWED
		tfa.Energy.Management.READ
		tfa.Energy.Management.RWED
		tfa.Energy.Procurement.READ
		tfa.Energy.Procurement.RWED	
		tfa.Energy.ProjectControls.READ
		tfa.Energy.ProjectControls.RWED
		tfa.Energy.READ	tfa.Energy.RWED

	
	.EXAMPLE
				PS C:\> Add-EnergyCADDDesigner $Username
	
	.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-EnergyCADDDesigner
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
	

	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.RWED') | Out-Null
	$ADGroups.add('stfa.Energy.CIP.READ') | Out-Null
	$ADGroups.add('stfa.Energy.CIP.RWED') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.RWED') | Out-Null
	$ADGroups.add('stfa.Energy.Regulatory.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Regulatory.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.BusnessDevelopment.READ') | Out-Null
	$ADGroups.add('tfa.Energy.BusnessDevelopment.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Drafting.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Drafting.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Management.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Management.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.ProjectControls.READ') | Out-Null
	$ADGroups.add('tfa.Energy.ProjectControls.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.READ') | Out-Null
	$ADGroups.add('tfa.Energy.RWED') | Out-Null
	
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Energy - Engineering') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('CHV Safety Reports Group') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Owner') | Out-Null
	$ADGroups.add('FWC55Approvers') | Out-Null
	$ADGroups.add('Drive J - Business') | Out-Null
	$ADGroups.add('CANA Energy PMs') | Out-Null
    
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Shared.CHVCUSharedFolder.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Xenapp_RDP') | Out-Null
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