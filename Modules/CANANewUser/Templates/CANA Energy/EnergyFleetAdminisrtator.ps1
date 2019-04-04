<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 10:47 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyFleetAdminisrtator.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyFleetAdminisrtator 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyFleetAdminisrtator  
#>


function Add-EnergyFleetAdminisrtator
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		141GeneralAccountant
		151ProjectAccountant
		161APCoordinator
		171ARCoordinator
		181AccountingAssistant
		331Purchaser
		341Inventory
		Acct.CANA Utilities.AP
		Acct.CANA Utilities.AR
		Acct.CANA Utilities.Equipment
		Acct.CANA Utilities.Proj Acct
		Acct.CANA.AP
		Acct.CANA.AR
		Acct.CANA.Equipment
		Acct.CANA.Proj Acct
		Acct.InterCo.Acct Manuals
		Acct.InterCo.AP
		Acct.InterCo.AR
		Acct.InterCo.Proj Acct
		Acct.OtherCo
		Acct.Purchase Journals
		Acct_Eq
		Acct_OtherCo
		Acct_PayrollTransfer_RW
		Acct_Users
		Ace_DR_Sec
		Ace_EquipCerts_RW_Sec
		Ace_Sec
		All Head Office Users
		All Users
		ApprovedDriversCUT
		CANA Construction Accounting
		CANA Construction Incident Reports
		CANA Equipment Management
		CANA FWC Users
		CANA High Voltage Safety
		CANA Lunch Special
		CANA Material Management
		CANA Utilities Fleet
		CANA Utilities Fleet Repairs
		CANA Utilities Incident Reports
		CANA Utilities Users
		CANA WCB Clearances
		Drive K - DFS_Mapping
		Email Archiving Enabled
		Est_Sec
		Mbx.Reception
		PF_Accounting_AP_Permissions
		PF_Accounting_POReceiving_Owner
		Printer Access RM112-Mailroom - Aficio 2500 Secondary
		Printer Access RM115-Reception - HP 2035n Secondary
		Printer Access RM438F-Construction Admin - Aficio 820dn Sec
		Printer Access RM438Y-Southeast- Ricoh 4504ex Default
		Salaried Employees
		SP.Accounting.Equipment
		SP.All.Construction.R
		SP.Approved.Drivers.HR
		SP.Equipment.Contribute
		SP.Equipment.Read
		SP.Fleet.Management
		SP.HRDriver.Documents
		SP_Accounting_Staff
		SP_Energy_Supervisors
		SP_Fleet_Management
		stfa.CCCLProjectJobs.RWED
		SW_FWC_Users
		SW_Viewpoint_Test
		SW_Viewpoint_Users
		tfa.Accounting.AccountingHandbook.Read
		tfa.Accounting.CANA.AP.RWED
		tfa.Accounting.CANA.AR.RWED
		tfa.Accounting.CANA.Equipment.RWED
		tfa.Accounting.CANA.FinanAccounting.RWED
		tfa.Accounting.CANA.ProjAcct.RWED
		tfa.Accounting.CANAUtilties.AP.RWED
		tfa.Accounting.CANAUtilties.AR.RWED
		tfa.Accounting.CANAUtilties.Equipment.RWED
		tfa.Accounting.CANAUtilties.FinanAcct.RWED
		tfa.Accounting.CANAUtilties.ProjAcct.RWED
		tfa.Accounting.InterCo.AccountingManuals.RWED
		tfa.Accounting.InterCo.AP.RWED
		tfa.Accounting.InterCo.AR.Read
		tfa.Accounting.InterCo.ProjAcct.RWED
		tfa.Accounting.OtherCo.AP.RWED
		tfa.Accounting.OtherCo.AR.RWED
		tfa.Accounting.OtherCo.Equipment.RWED
		tfa.Accounting.OtherCo.FinanAcct.RWED
		tfa.Accounting.OtherCo.ProjAcct.RWED
		tfa.Accounting.Read
		tfa.Accounting.RWED
		tfa.Accounting.SalesJournals.Read
		tfa.Accouting.AccountingHandbook.Read
		tfa.Estimating.RWED
		tfa.Finance.AP-CANA.RWED
		tfa.Finance.Insurance.RWED
		tfa.Utilities.ClaimsForPropertyDamage.Read
		tfa.Utilities.Divisions.Read
		tfa.Utilities.EquipmentCertificates.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		tfa.UtilitiesDR.RWED
		Viewpoint Users
		Vista Viewpoint Users
		XenApp_BO
		XenApp75_Print_Acct_2ndFL
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyFleetAdminisrtator $Username
	
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
	$ADGroups.add('141GeneralAccountant') | Out-Null
	$ADGroups.add('151ProjectAccountant') | Out-Null
	$ADGroups.add('161APCoordinator') | Out-Null
	$ADGroups.add('171ARCoordinator') | Out-Null
	$ADGroups.add('181AccountingAssistant') | Out-Null
	$ADGroups.add('331Purchaser') | Out-Null
	$ADGroups.add('341Inventory') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.AP') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.AR') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.Equipment') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.Proj Acct') | Out-Null
	$ADGroups.add('Acct.CANA.AP') | Out-Null
	$ADGroups.add('Acct.CANA.AR') | Out-Null
	$ADGroups.add('Acct.CANA.Equipment') | Out-Null
	$ADGroups.add('Acct.CANA.Proj Acct') | Out-Null
	$ADGroups.add('Acct.InterCo.Acct Manuals') | Out-Null
	$ADGroups.add('Acct.InterCo.AP') | Out-Null
	$ADGroups.add('Acct.InterCo.AR') | Out-Null
	$ADGroups.add('Acct.InterCo.Proj Acct') | Out-Null
	$ADGroups.add('Acct.OtherCo') | Out-Null
	$ADGroups.add('Acct.Purchase Journals') | Out-Null
	$ADGroups.add('Acct_Eq') | Out-Null
	$ADGroups.add('Acct_OtherCo') | Out-Null
	$ADGroups.add('Acct_PayrollTransfer_RW') | Out-Null
	$ADGroups.add('Acct_Users') | Out-Null
	$ADGroups.add('Ace_DR_Sec') | Out-Null
	$ADGroups.add('Ace_EquipCerts_RW_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('ApprovedDriversCUT') | Out-Null
	$ADGroups.add('CANA Construction Accounting') | Out-Null
	$ADGroups.add('CANA Construction Incident Reports') | Out-Null
	$ADGroups.add('CANA Equipment Management') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA High Voltage Safety') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Material Management') | Out-Null
	$ADGroups.add('CANA Utilities Fleet') | Out-Null
	$ADGroups.add('CANA Utilities Fleet Repairs') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CANA WCB Clearances') | Out-Null
	$ADGroups.add('Drive K - DFS_Mapping') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('Est_Sec') | Out-Null
	$ADGroups.add('Mbx.Reception') | Out-Null
	$ADGroups.add('PF_Accounting_AP_Permissions') | Out-Null
	$ADGroups.add('PF_Accounting_POReceiving_Owner') | Out-Null
	$ADGroups.add('Printer Access RM112-Mailroom - Aficio 2500 Secondary') | Out-Null
	$ADGroups.add('Printer Access RM115-Reception - HP 2035n Secondary') | Out-Null
	$ADGroups.add('Printer Access RM438F-Construction Admin - Aficio 820dn Sec') | Out-Null
	$ADGroups.add('Printer Access RM438Y-Southeast- Ricoh 4504ex Default') | Out-Null
	$ADGroups.add('Salaried Employees') | Out-Null
	$ADGroups.add('SP.Accounting.Equipment') | Out-Null
	$ADGroups.add('SP.All.Construction.R') | Out-Null
	$ADGroups.add('SP.Approved.Drivers.HR') | Out-Null
	$ADGroups.add('SP.Equipment.Contribute') | Out-Null
	$ADGroups.add('SP.Equipment.Read') | Out-Null
	$ADGroups.add('SP.Fleet.Management') | Out-Null
	$ADGroups.add('SP.HRDriver.Documents') | Out-Null
	$ADGroups.add('SP_Accounting_Staff') | Out-Null
	$ADGroups.add('SP_Energy_Supervisors') | Out-Null
	$ADGroups.add('SP_Fleet_Management') | Out-Null
	$ADGroups.add('stfa.CCCLProjectJobs.RWED') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Test') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Accounting.AccountingHandbook.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.AR.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.FinanAccounting.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.AR.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.FinanAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AccountingManuals.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AR.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.AR.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.FinanAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.SalesJournals.Read') | Out-Null
	$ADGroups.add('tfa.Accouting.AccountingHandbook.Read') | Out-Null
	$ADGroups.add('tfa.Estimating.RWED') | Out-Null
	$ADGroups.add('tfa.Finance.AP-CANA.RWED') | Out-Null
	$ADGroups.add('tfa.Finance.Insurance.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ClaimsForPropertyDamage.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.Divisions.Read') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('tfa.UtilitiesDR.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp_BO') | Out-Null
	$ADGroups.add('XenApp75_Print_Acct_2ndFL') | Out-Null
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