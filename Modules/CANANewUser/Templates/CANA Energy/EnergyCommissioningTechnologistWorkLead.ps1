<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/02/2019 11:39 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	Commissioning-Technologist-Work-Lead.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-CommissioningTechnologistWorkLead
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-CommissioningTechnologistWorkLead
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		371APReviewer
		CANA Energy Users
		All Head Office Users
		All Users
		CANA High Voltage Commisioning Owners
		CHV Incident Notification Reports
		CHV Incident Notification Reports - Near Miss
		CHV Safety Reports Group
		Email Archiving Enabled
		EXCH_PF_CHV_Calendar_Owner
		FWC55TimeKeeper
		
		GSG.HTI.DrawingManagement.RO
		GSG.HTI.Engineering.RO
		GSG.HTI.PanelShop.RW
		GSG.HTI.Shared.RW
		GSG.HTI.TestingCommissioning.RW
		Printer Access RMW202A-Mezzanine - Aficio 4504 Default
		SP.All.CHV.R
		SP.HighVoltage.Milage
		SP_CHV_Staff
		SP_Energy_Foremen
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVArchive.Read
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.Read
		tfa.CHVDWGScans.Read
		tfa.CHVEngineering.Read
		tfa.CHVPanelShop.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		tfa.CHVTestingAndCommissioning.RWED
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-CommissioningTechnologistWorkLead $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-CommissioningTechnologistWorkLead
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
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA High Voltage Commisioning Owners') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('CHV Safety Reports Group') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Owner') | Out-Null
	$ADGroups.add('FWC55TimeKeeper') | Out-Null
	
	$ADGroups.add('GSG.HTI.DrawingManagement.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RO') | Out-Null
	$ADGroups.add('GSG.HTI.PanelShop.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('GSG.HTI.TestingCommissioning.RW') | Out-Null
	$ADGroups.add('Printer Access RMW202A-Mezzanine - Aficio 4504 Default') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP.HighVoltage.Milage') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Foremen') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.Read') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.Read') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.Read') | Out-Null
	$ADGroups.add('tfa.CHVPanelShop.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.CHVTestingAndCommissioning.RWED') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
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