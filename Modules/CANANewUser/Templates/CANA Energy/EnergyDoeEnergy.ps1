<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 8:51 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	DoeEnergy.ps1
	===========================================================================
		.SYNOPSIS
		Adds the user to the groups defined in this function Add-DoeEnergy
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-DoeEnergy
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		311ProjectManager
		351Estimator
		361POReceiver
		371APReviewer
		All CHV Users
		All Head Office Users
		All Users
		CANA FWC Users
		CANA High Voltage Commisioning Owners
		CANA High Voltage iOS Users
		CANA High Voltage Tenders
		CANA Lunch Special
		CHV Engineering
		Email Archiving Enabled
		FWC55Approvers
		GSG.CHV.Bid2Win.RW
		GSG.HTI.AllUsers
		GSG.HTI.BusinessDevelopment.RW
		GSG.HTI.DrawingManagement.RO
		GSG.HTI.Engineering.RO
		GSG.HTI.Engineering.RW
		GSG.HTI.Shared.RW
		Printer Access RM 207-West Kitchen Area – HP 880Z Secondary
		Printer Access RM225-File Room - Aficio 6004 Default
		SP KnowMatrix Notice CU
		SP.All.CHV.R
		SP_CHV_Managers
		SP_Energy_Management
		SP_Managers_All
		stfa.CHVProjectJobs.JobNumber.Read
		stfa.CHVProjectJobs.JobNumber.RWED
		SW_Acrobat_Pro_Users
		SW_Firebird_Database
		SW_FWC_Users
		SW_Viewpoint_Users
		tfa.CHVArchive.Read
		tfa.CHVBusinessDevelopment.RWED
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.Read
		tfa.CHVDWGScans.Read
		tfa.CHVEngineering.RWED
		tfa.CHVManual.RWED
		tfa.CHVProjectJobs.JobNumber.Read
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.ProjectManagement.CostProjections.Read
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		Viewpoint Users
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		XenApp75_Users
	
	.EXAMPLE
				PS C:\> Add-DoeEnergy $Username
	
.NOTES
		Using an array and a foreach loop, the listed AD groups are added to the users group membership.  This file is expected to be imported in to the overall module to allow flexibility for adding new rolls, or modifying existing ones without having to modify the core script or module.
#>
function Add-DoeEnergy
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory,ValueFromPipeline)]
		[string]$Username
	)
	Write-Debug "The username is $Username"
	Write-Debug "Creating empty array"
	$ADGroups = [System.Collections.ArrayList]@()
	
	Write-Debug "Adding groups to the Array"
	Write-Verbose "Adding groups to the Array"
	
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('311ProjectManager') | Out-Null
	$ADGroups.add('351Estimator') | Out-Null
	$ADGroups.add('361POReceiver') | Out-Null
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('All CHV Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA High Voltage Commisioning Owners') | Out-Null
	$ADGroups.add('CANA High Voltage iOS Users') | Out-Null
	$ADGroups.add('CANA High Voltage Tenders') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CHV Engineering') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('FWC55Approvers') | Out-Null
	$ADGroups.add('GSG.CHV.Bid2Win.RW') | Out-Null
	$ADGroups.add('GSG.HTI.AllUsers') | Out-Null
	$ADGroups.add('GSG.HTI.BusinessDevelopment.RW') | Out-Null
	$ADGroups.add('GSG.HTI.DrawingManagement.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('Printer Access RM 207-West Kitchen Area – HP 880Z Secondary') | Out-Null
	$ADGroups.add('Printer Access RM225-File Room - Aficio 6004 Default') | Out-Null
	$ADGroups.add('SP KnowMatrix Notice CU') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Management') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('SW_Acrobat_Pro_Users') | Out-Null
	$ADGroups.add('SW_Firebird_Database') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVBusinessDevelopment.RWED') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.Read') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.Read') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null
	$ADGroups.add('tfa.CHVManual.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.ProjectManagement.CostProjections.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
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