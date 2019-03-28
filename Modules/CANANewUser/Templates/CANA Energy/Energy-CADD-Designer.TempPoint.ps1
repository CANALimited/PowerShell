<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	03/26/2019 11:13 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	Energy-CADD-Designer.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All CHV Users
		All Head Office Users
		All Users
		CANA Lunch Special   
		CHV Engineering
		Email Archiving Enabled
		GSG.HTI.AllUsers
		GSG.HTI.DrawingManagement.RO
		GSG.HTI.DrawingManagement.RW
		GSG.HTI.Shared.RW
		Plotter Access CHV
		Printer Access RM 207-West Kitchen Area – HP 880Z Secondary
		Printer Access RM225-File Room - Aficio 6004 Default 
		SP.All.CHV.R   
		SP_CHV_Staff   
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.Read 
		SW_Acrobat_Pro_Users 
		SW_FWC_Users   
		tfa.CHVArchive.Read  
		tfa.CHVCommon.RWED
		tfa.CHVDrawingManagement.RWED
		tfa.CHVDWGScans.RWED 
		tfa.CHVEngineering.Read
		tfa.CHVProjectJobs.JobNumber.Read  
		tfa.CHVProjectJobs.Read
		XenApp75_Test_Users
	
	.EXAMPLE
				PS C:\> Add-Energy-CADD-Designer $Username
	
	.NOTES
		Additional information about the function.
#>
function Add-Energy-CADD-Designer
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)]
		[string]$Username
	)
	
	Write-Debug "Adding groups to the Array"
	Write-Verbose "Adding groups to the Array"
	
	$ADGroups += 'All CHV Users'
	$ADGroups += 'All Head Office Users'
	$ADGroups += 'All Users'
	$ADGroups += 'CANA Lunch Special'
	$ADGroups += 'CHV Engineering'
	$ADGroups += 'Email Archiving Enabled'
	$ADGroups += 'GSG.HTI.AllUsers'
	$ADGroups += 'GSG.HTI.DrawingManagement.RO'
	$ADGroups += 'GSG.HTI.DrawingManagement.RW'
	$ADGroups += 'GSG.HTI.Shared.RW'
	$ADGroups += 'Plotter Access CHV'
	$ADGroups += 'Printer Access RM 207-West Kitchen Area – HP 880Z Secondary'
	$ADGroups += 'Printer Access RM225-File Room - Aficio 6004 Default'
	$ADGroups += 'SP.All.CHV.R'
	$ADGroups += 'SP_CHV_Staff'
	$ADGroups += 'stfa.CHVProjectJobs.JobNumber.Read'
	$ADGroups += 'SW_Acrobat_Pro_Users'
	$ADGroups += 'SW_FWC_Users'
	$ADGroups += 'tfa.CHVArchive.Read'
	$ADGroups += 'tfa.CHVCommon.RWED'
	$ADGroups += 'tfa.CHVDrawingManagement.RWED'
	$ADGroups += 'tfa.CHVDWGScans.RWED'
	$ADGroups += 'tfa.CHVEngineering.Read'
	$ADGroups += 'tfa.CHVProjectJobs.JobNumber.Read'
	$ADGroups += 'tfa.CHVProjectJobs.Read'
	$ADGroups += 'XenApp75_Test_Users'
	
	Write-Debug "Array contains $($_ADGroups)"
	Write-Verbose "Added list of groups to array"
	
	Write-Debug "Starting Foreach"
	foreach ($ADGroup in $ADGroups)
	{
		Add-ADGroupMember -Identity $ADGroup -Members $Username
		Write-Debug "Adding $($_Username) to the group $($_ADGroup)"
		Write-Verbose "Adding $($_Username) to the group $($_ADGroup)"
	}
	
}