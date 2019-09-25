<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 2:01 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyWarehouseCoordinator.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyWarehouseCoordinator 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyWarehouseCoordinator 
#>


function Add-EnergyWarehouseCoordinator
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
		371APReviewer
		CANA Energy Users
		All Head Office Users
		CANA Equipment Management
		CANA FWC Users
		
		CANA Material Management
		CANA Utilities Yard Sign-in
		Email Archiving Enabled
		
		GSG.HTI.Conac.RW
		GSG.HTI.Engineering.RW
		GSG.HTI.PanelShop.RO
		GSG.HTI.Purchasing.RW
		GSG.HTI.Shared.RW
		SP.All.CHV.R
		SP_CHV_Staff
		SP_Energy_Staff
		stfa.CHVProjectJobs.JobNumber.Read
		SW_FWC_Users
		SW_Viewpoint_Test
		SW_Viewpoint_Users
		tfa.CHVArchive.Read
		tfa.CHVCommon.RWED
		tfa.CHVEngineering.RWED
		tfa.CHVPanelShop.Read
		tfa.CHVPivot9.RWED
		tfa.CHVProjectJobs.JobNumber.Read
		tfa.CHVProjectJobs.JobNumber.RWED
		tfa.CHVProjectJobs.Read
		tfa.CHVProjectJobs.RWED
		tfa.CHVPurchasing.RWED
		Viewpoint Users
		Vista Viewpoint Users
		Xenapp_eCMS
		XenApp75_eCMS
		XenApp75_Print_ShopFL
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyWarehouseCoordinator $Username
	
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
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('CANA Energy Users') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA Equipment Management') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	
	$ADGroups.add('CANA Material Management') | Out-Null
	$ADGroups.add('CANA Utilities Yard Sign-in') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	
	$ADGroups.add('GSG.HTI.Conac.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Engineering.RW') | Out-Null
	$ADGroups.add('GSG.HTI.PanelShop.RO') | Out-Null
	$ADGroups.add('GSG.HTI.Purchasing.RW') | Out-Null
	$ADGroups.add('GSG.HTI.Shared.RW') | Out-Null
	$ADGroups.add('SP.All.CHV.R') | Out-Null
	$ADGroups.add('SP_CHV_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('stfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Test') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.CHVArchive.Read') | Out-Null
	$ADGroups.add('tfa.CHVCommon.RWED') | Out-Null
	$ADGroups.add('tfa.CHVEngineering.RWED') | Out-Null
	$ADGroups.add('tfa.CHVPanelShop.Read') | Out-Null
	$ADGroups.add('tfa.CHVPivot9.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.JobNumber.RWED') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.Read') | Out-Null
	$ADGroups.add('tfa.CHVProjectJobs.RWED') | Out-Null
	$ADGroups.add('tfa.CHVPurchasing.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('Xenapp_eCMS') | Out-Null
	$ADGroups.add('XenApp75_eCMS') | Out-Null
	$ADGroups.add('XenApp75_Print_ShopFL') | Out-Null
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