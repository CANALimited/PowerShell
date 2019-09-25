<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	04/04/2019 12:04 PM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	EnergyProgramDirectorInfrastructure.ps1
	===========================================================================
	.SYNOPSIS
		Adds the user to the groups defined in this function Add-EnergyProgramDirectorInfrastructure 
	
	.DESCRIPTION
		Adds the user to the groups defined in this function Add-EnergyProgramDirectorInfrastructure 
#>


function Add-EnergyProgramDirectorInfrastructure
{
<#
	.SYNOPSIS
		Adds the user to the groups defined in this function
	
	.DESCRIPTION
		Adds the user to the groups defined in this function

		All Users
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
		CANA FWC Users
		
		CANA Utilities Deposits
		CANA Utilities Equipment
		CANA Utilities Incident Reports
		CANA Utilities iOS Users
		CANA Utilities Safety Reports
		CANA Utilities Senior Management
		CANA Utilities Tenders
		CANA Utilities Users
		CHV Incident Notification Reports
		Email Archiving Enabled
		Employee Share Holders
		Est_Sec
		FWC52Approvers
		FWC55Approvers
		Plotter Access CUT
		Safety_AceDR_Sec
		Safety_Sec
		Salaried Employees
		Senior Management
		SP KnowMatrix Notice Atco
		SP KnowMatrix Notice CU
		SP KnowMatrix Notice Sub
		SP.All.CU.R
		SP.Announcements
		SP.Roaming.Approvals
		SP.Utilities.Milage
		SP.UtilitiesCert
		SP_CUT_Managers
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
				PS C:\> Add-EnergyProgramDirectorInfrastructure $Username
	
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
	$ADGroups.add('All Head Office Users') | Out-Null
	$ADGroups.add('CANA FWC Users') | Out-Null
	
	$ADGroups.add('Email Archiving Enabled') | Out-Null
	$ADGroups.add('Est_Sec') | Out-Null
	$ADGroups.add('FWC52Approvers') | Out-Null
	$ADGroups.add('Senior Management') | Out-Null
	$ADGroups.add('SP.Announcements') | Out-Null
	$ADGroups.add('SP_Managers_All') | Out-Null
	$ADGroups.add('SP_Energy_Staff') | Out-Null
	$ADGroups.add('SP.Energy.Senior.Management') | Out-Null
	$ADGroups.add('SP_Energy_Management') | Out-Null
	$ADGroups.add('SP_Energy_VIPs') | Out-Null
	$ADGroups.add('CANA Energy - Infrastructure') | Out-Null
	$ADGroups.add('SW_FWC_Users') | Out-Null
	$ADGroups.add('SW_Viewpoint_Users') | Out-Null
	$ADGroups.add('Viewpoint Users') | Out-Null
	$ADGroups.add('Vista Viewpoint Reviewers') | Out-Null
	$ADGroups.add('Vista Viewpoint Users') | Out-Null
	$ADGroups.add('XenApp75_Users') | Out-Null
	$ADGroups.add('XenApp75_Viewpoint_Prod') | Out-Null
	
	$ADGroups.add('rfa.Energy') | Out-Null
	$ADGroups.add('stfa.Energy.Archive.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Engineering.READ') | Out-Null
	$ADGroups.add('stfa.Energy.Regulatory.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Administrative.READ') | Out-Null
	$ADGroups.add('tfa.Energy.Management.RWED') | Out-Null
	$ADGroups.add('tfa.Energy.Procurement.READ') | Out-Null
	$ADGroups.add('tfa.Energy.READ') | Out-Null






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