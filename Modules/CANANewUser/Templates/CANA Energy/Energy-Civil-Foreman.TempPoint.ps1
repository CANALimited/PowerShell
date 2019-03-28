﻿<#	
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
	Write-Debug "The username is $Username"
	Write-Debug "Creating empty array"
	$ADGroups = [System.Collections.ArrayList]@()
	
	Write-Debug "Adding groups to the Array"
	Write-Verbose "Adding groups to the Array"
	
	$ADGroups.add('All CHV Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('All Users') | Out-Null
	$ADGroups.add('CHV Engineering') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('GSG.HTI.AllUsers') | Out-Null
	$ADGroups.add('GSG.HTI.DrawingManagement.RO') | Out-Null
	$ADGroups.add('GSG.HTI.DrawingManagement.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('Plotter Access CHV') | Out-Null
	$ADGroups.add('Printer Access RM 207-West Kitchen Area – HP 880Z Secondary') | Out-Null
	$ADGroups.add('Printer Access RM225-File Room - Aficio 6004 Default') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('SW_Acrobat_Pro_Users') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDrawingManagement.RWED') | Out-Null
	$ADGroups.add('tfa.CHVDWGScans.RWED') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('XenApp75_Test_Users') | Out-Null
	
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