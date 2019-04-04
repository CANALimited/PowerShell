<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/02/2019 9:06 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	Commissioning-Supervisor.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-CommissioningSupervisor
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-CommissioningSupervisor
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		371APReviewer
		All CHV Users
		All Head Office Users
		All Users
		CANA FWC Users
		CANA High Voltage Commisioning Owners
		CANA High Voltage iOS Users
		CANA High Voltage Tenders
		CANA Lunch Special
		CANA Utilities Incident Reports
		CHV Engineering
		CHV Incident Notification Reports
		CHV Incident Notification Reports - Near Miss
		CHV Safety Reports Group
		Email Archiving Enabled
		EXCH_PF_CHV_Calendar_Owner
		FWC55Approvers
		GSG.HTI.AllUsers
		GSG.HTI.BusinessDevelopment.RO
		GSG.HTI.BusinessDevelopment.RW
		GSG.HTI.Engineering.RO
		GSG.HTI.PanelShop.RW
		GSG.HTI.Shared.RW
		GSG.HTI.TestingCommissioning.RO
		GSG.HTI.TestingCommissioning.RW
		Printer Access RMW202A-Mezzanine - Aficio 4504 Default
		Social Committee
		SP.All.CHV.R
		SP.HighVoltage.Milage
		SP_CHV_Managers
		SP_Energy_Supervisors
		SP_Managers_All
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVArchive.Read
		tfa.CHVBusinessDevelopment.Read
		tfa.CHVBusinessDevelopment.RWED
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.Read
		tfa.CHVDWGScans.Read
		tfa.CHVEngineering.Read
		tfa.CHVPanelShop.RWED
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.ProjectManagement.CostProjections.Read
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		tfa.CHVTestingAndCommissioning.RWED
		tfa.SafetyHVU.RWED
		tfa.Shared.CHVCUSharedFolder.RWED
		Viewpoint Users
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		Xenapp_RDP
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-CommisioningTechnologistSr $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-CommissioningSupervisor
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
	$ADGroups.add('All CHV Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA High Voltage Commisioning Owners') | Out-Null
	$ADGroups.add('CANA High Voltage iOS Users') | Out-Null
	$ADGroups.add('CANA High Voltage Tenders') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CHV Engineering') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports - Near Miss') | Out-Null
	$ADGroups.add('CHV Safety Reports Group') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('EXCH_PF_CHV_Calendar_Owner') | Out-Null
	$ADGroups.add('FWC55Approvers') | Out-Null
	$ADGroups.add('GSG.HTI.AllUsers') | Out-Null
	$ADGroups.add('GSG.HTI.BusinessDevelopment.RO') | Out-Null
	$ADGroups.add('GSG.HTI.BusinessDevelopment.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RO') | Out-Null
	$ADGroups.add('GSG.HTI.PanelShop.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('GSG.HTI.TestingCommissioning.RO') | Out-Null
	$ADGroups.add('GSG.HTI.TestingCommissioning.RW') | Out-Null
	$ADGroups.add('Printer Access RMW202A-Mezzanine - Aficio 4504 Default') | Out-Null
	$ADGroups.add('Social Committee') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP.HighVoltage.Milage') | Out-Null
	$ADGroups.add('SP_CHV_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Supervisors') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVBusinessDevelopment.Read') | Out-Null
	$ADGroups.add('tfa.CHVBusinessDevelopment.RWED') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.Read') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.Read') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.Read') | Out-Null
	$ADGroups.add('tfa.CHVPanelShop.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.ProjectManagement.CostProjections.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.CHVTestingAndCommissioning.RWED') | Out-Null
	$ADGroups.add('tfa.SafetyHVU.RWED') | Out-Null
	$ADGroups.add('tfa.Shared.CHVCUSharedFolder.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
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