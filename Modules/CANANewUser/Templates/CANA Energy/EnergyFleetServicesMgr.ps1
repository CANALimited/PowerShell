<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 11:08 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyFleetServicesMgr.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyFleetServicesMgr 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyFleetServicesMgr 
#>


function Add-EnergyFleetServicesMgr
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		311ProjectManager
		371APReviewer
		391VicePresidentOperations
		Acct.CANA Utilities.AP
		Acct.CANA Utilities.AR
		Acct.CANA Utilities.Equipment
		Acct.CANA Utilities.Finan Acct
		Acct.CANA Utilities.PR
		Acct.CANA Utilities.Proj Acct
		Acct_Ace_Sec
		Acct_Users
		Ace_BirdProtection_Sec
		Ace_DR_R_Sec
		Ace_EmpCerts_RW_Sec
		Ace_EquipCerts_RW_Sec
		Ace_Mgmt_Sec
		Ace_Root_Sec
		Ace_Sec
		Ace_SnrMgmt
		ACE_WklyMgrMtgs_Sec
		All Head Office Users
		CANA Construction Incident Reports
		CANA Equipment Management
		CANA FWC Users
		CANA Lunch Special
		CANA Utilities Deposits
		CANA Utilities Equipment
		CANA Utilities Incident Reports
		CANA Utilities iOS Users
		CANA Utilities Safety Reports
		CANA Utilities Senior Management
		CANA Utilities Users
		CHV Incident Notification Reports
		Email Archiving Enabled
		Employee Share Holders
		Est_Sec
		FWC52Approvers
		FWC55Approvers
		Plotter Access CUT
		Printer Access RM407-4th Floor Kitchen Area - Aficio 4503 Sec
		Printer Access RM429-Executive Main - HP 880z Default
		Safety_AceDR_Sec
		Safety_Sec
		Salaried Employees
		Senior Management
		SP KnowMatrix Notice Atco
		SP KnowMatrix Notice CU
		SP KnowMatrix Notice Sub
		SP.All.CU.R
		SP.Announcements
		SP.Fleet.Management
		SP.Roaming.Approvals
		SP.Utilities.Milage
		SP.UtilitiesCert
		SP_CUT_Managers
		SP_Energy_Management
		SP_Fleet_Management
		SP_Managers_All
		stfa.CCCLProjectJobs.RWED
		stfa.Utilities.Project.MGMTCNTL
		stfa.Utilities.Project.RWED
		SurfCont-PEM
		SW_FWC_Users
		SW_Project_Users
		SW_Viewpoint_Users
		tfa.Accounting.AccountingHandbook.Read
		tfa.Accounting.CANA.AP.Read
		tfa.Accounting.CANA.AR.Read
		tfa.Accounting.CANA.Equipment.Read
		tfa.Accounting.CANA.ProjAcct.RWED
		tfa.Accounting.CANAUtilties.AP.RWED
		tfa.Accounting.CANAUtilties.AR.RWED
		tfa.Accounting.CANAUtilties.Equipment.RWED
		tfa.Accounting.CANAUtilties.FinanAcct.RWED
		tfa.Accounting.CANAUtilties.PR.RWED
		tfa.Accounting.CANAUtilties.ProjAcct.RWED
		tfa.Accounting.InterCo.AccountingManuals.RWED
		tfa.Accounting.InterCo.AP.RWED
		tfa.Accounting.InterCo.AR.Read
		tfa.Accounting.InterCo.ProjAcct.RWED
		tfa.Accounting.OtherCo.AP.Read
		tfa.Accounting.Read
		tfa.Accounting.RWED
		tfa.Accounting.SalesJournals.Read
		tfa.Accouting.AccountingHandbook.Read
		tfa.Estimating.RWED
		tfa.Safety.RWED
		tfa.Shared.CHVCUSharedFolder.RWED
		tfa.Utilities.Administration.RWED
		tfa.Utilities.ClaimsForPropertyDamage.RWED
		tfa.Utilities.Crew&ProjectResources.RWED
		tfa.Utilities.CUWeeklyMeetings.RWED
		tfa.Utilities.Divisions.RWED
		tfa.Utilities.EmployeeCertificates.RWED
		tfa.Utilities.EmployeeFieldAssessment.RWED
		tfa.Utilities.EquipmentCertificates.RWED
		tfa.Utilities.Estimate.RWED
		tfa.Utilities.EstimatingInfo.RWED
		tfa.Utilities.FortMacMurrayFiles.RWED
		tfa.Utilities.Management.RWED
		tfa.Utilities.Material&Equipment.RWED
		tfa.Utilities.MonthlyReporting.RWED
		tfa.Utilities.Prequalifications.RWED
		tfa.Utilities.Project.2012.RWED
		tfa.Utilities.Project.BirdProtection.RWED
		tfa.Utilities.Project.Estimate.RWED
		tfa.Utilities.Project.RWED
		tfa.Utilities.ProjectSummaries&References.RWED
		tfa.Utilities.Proposals.RWED
		tfa.Utilities.Purchasing.RWED
		tfa.Utilities.RWED
		tfa.Utilities.Scans.RWED
		tfa.Utilities.SeniorManagement.RWED
		tfa.Utilities.SimpsonProjects.RWED
		tfa.Utilities.StrategySessions.RWED
		tfa.Utilities.StructureandStandardsManualPlusMaps.RWED
		tfa.Utilities.Training.RWED
		tfa.Utilities.VPEA.RWED
		tfa.Utilities.VPFiles.RWED
		tfa.UtilitiesDR.RWED
		Viewpoint Users
		Vista Viewpoint Reviewers
		Vista Viewpoint Users
		XenApp75_Adobe_Acrobat_Standard
		XenApp75_Heavybid
		Xenapp75_Project2010
		Xenapp75_Project2016
		XenApp75_Users
		XenApp75_Viewpoint_Prod
	
	.EXAMPLE
				PS C:\> Add-EnergyFleetServicesMgr $Username
	
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
	$ADGroups.add('371APReviewer') | Out-Null
	$ADGroups.add('391VicePresidentOperations') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.AP') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.AR') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.Equipment') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.Finan Acct') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.PR') | Out-Null
	$ADGroups.add('Acct.CANA Utilities.Proj Acct') | Out-Null
	$ADGroups.add('Acct_Ace_Sec') | Out-Null
	$ADGroups.add('Acct_Users') | Out-Null
	$ADGroups.add('Ace_BirdProtection_Sec') | Out-Null
	$ADGroups.add('Ace_DR_R_Sec') | Out-Null
	$ADGroups.add('Ace_EmpCerts_RW_Sec') | Out-Null
	$ADGroups.add('Ace_EquipCerts_RW_Sec') | Out-Null
	$ADGroups.add('Ace_Mgmt_Sec') | Out-Null
	$ADGroups.add('Ace_Root_Sec') | Out-Null
	$ADGroups.add('Ace_Sec') | Out-Null
	$ADGroups.add('Ace_SnrMgmt') | Out-Null
	$ADGroups.add('ACE_WklyMgrMtgs_Sec') | Out-Null
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA Construction Incident Reports') | Out-Null
	$ADGroups.add('CANA Equipment Management') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	$ADGroups.add('CANA Lunch Special') | Out-Null
	$ADGroups.add('CANA Utilities Deposits') | Out-Null
	$ADGroups.add('CANA Utilities Equipment') | Out-Null
	$ADGroups.add('CANA Utilities Incident Reports') | Out-Null
	$ADGroups.add('CANA Utilities iOS Users') | Out-Null
	$ADGroups.add('CANA Utilities Safety Reports') | Out-Null
	$ADGroups.add('CANA Utilities Senior Management') | Out-Null
	$ADGroups.add('CANA Utilities Users') | Out-Null
	$ADGroups.add('CHV Incident Notification Reports') | Out-Null
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('Employee Share Holders') | Out-Null
	$ADGroups.add('Est_Sec') | Out-Null
	$ADGroups.add('FWC52Approvers') | Out-Null
	$ADGroups.add('FWC55Approvers') | Out-Null
	$ADGroups.add('Plotter Access CUT') | Out-Null
	$ADGroups.add('Printer Access RM407-4th Floor Kitchen Area - Aficio 4503 Sec') | Out-Null
	$ADGroups.add('Printer Access RM429-Executive Main - HP 880z Default') | Out-Null
	$ADGroups.add('Safety_AceDR_Sec') | Out-Null
	$ADGroups.add('Safety_Sec') | Out-Null
	$ADGroups.add('Salaried Employees') | Out-Null
	$ADGroups.add('Senior Management') | Out-Null
	$ADGroups.add('SP KnowMatrix Notice Atco') | Out-Null
	$ADGroups.add('SP KnowMatrix Notice CU') | Out-Null
	$ADGroups.add('SP KnowMatrix Notice Sub') | Out-Null
	$ADGroups.add('SP.All.CU.R') | Out-Null
	$ADGroups.add('SP.Announcements') | Out-Null
	$ADGroups.add('SP.Fleet.Management') | Out-Null
	$ADGroups.add('SP.Roaming.Approvals') | Out-Null
	$ADGroups.add('SP.Utilities.Milage') | Out-Null
	$ADGroups.add('SP.UtilitiesCert') | Out-Null
	$ADGroups.add('SP_CUT_Managers') | Out-Null
	$ADGroups.add('SP_Energy_Management') | Out-Null
	$ADGroups.add('SP_Fleet_Management') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('stfa.CCCLProjectJobs.RWED') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.MGMTCNTL') | Out-Null
	$ADGroups.add('stfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('SurfCont-PEM') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Project_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('tfa.Accounting.AccountingHandbook.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.AP.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.AR.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.Equipment.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.CANA.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.AR.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.FinanAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.PR.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.CANAUtilties.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AccountingManuals.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AP.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.AR.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.InterCo.ProjAcct.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.OtherCo.AP.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.Read') | Out-Null
	$ADGroups.add('tfa.Accounting.RWED') | Out-Null
	$ADGroups.add('tfa.Accounting.SalesJournals.Read') | Out-Null
	$ADGroups.add('tfa.Accouting.AccountingHandbook.Read') | Out-Null
	$ADGroups.add('tfa.Estimating.RWED') | Out-Null
	$ADGroups.add('tfa.Safety.RWED') | Out-Null
	$ADGroups.add('tfa.Shared.CHVCUSharedFolder.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Administration.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ClaimsForPropertyDamage.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Crew&ProjectResources.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.CUWeeklyMeetings.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Divisions.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EmployeeFieldAssessment.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EquipmentCertificates.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.EstimatingInfo.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.FortMacMurrayFiles.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Management.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Material&Equipment.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.MonthlyReporting.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Prequalifications.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.2012.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.BirdProtection.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.Estimate.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Project.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.ProjectSummaries&References.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Proposals.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Purchasing.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Scans.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.SeniorManagement.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.SimpsonProjects.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StrategySessions.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.StructureandStandardsManualPlusMaps.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.Training.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.VPEA.RWED') | Out-Null
	$ADGroups.add('tfa.Utilities.VPFiles.RWED') | Out-Null
	$ADGroups.add('tfa.UtilitiesDR.RWED') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Adobe_Acrobat_Standard') | Out-Null
	$ADGroups.add('XenApp75_Heavybid') | Out-Null
	$ADGroups.add('Xenapp75_Project2010') | Out-Null
	$ADGroups.add('Xenapp75_Project2016') | Out-Null
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