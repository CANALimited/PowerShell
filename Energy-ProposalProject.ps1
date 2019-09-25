<#	
	.NOTES
	===========================================================================
	 Created on:   	08/20/2019 8:13 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA
	 Filename:     	Energy-ProposalProject.ps1
	===========================================================================
	.DESCRIPTION
		This file will setup a new project folder in proposals Active.
#>

$ProjectName = Read-host -message "Please enter the projects name"
$ClientName = @(Get-ChildItem \\canagroup.cana-group\business\Energy\Clients | Out-GridView -Title 'Choose a file' -PassThru)

Set-Location -Path "\\canagroup.cana-group\business\Energy\Clients\$ClientName\Proposals\Active"


#-----
#
Write-Verbose "Creating $ProjectName"
mkdir $ProjectName
Write-Verbose "Removing Inheritance from $ProjectName"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName /T /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName /T /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Submission"
mkdir $ProjectName\Submission
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Submission\Draft"
mkdir $ProjectName\Submission\Draft
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Submission\Final"
mkdir $ProjectName\Submission\Final
Write-Verbose "Removing Inheritance from $ProjectName\Submission"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Submission with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Submission with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Removing Inheritance from $ProjectName\Submission\Draft"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Draft /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Submission\Draft with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Draft /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Submission\Draft with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Draft /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Submission\Draft with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Draft /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Submission\Final"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Draft /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Submission\Final with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Final /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Submission\Final with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Final /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Submission\Final with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Submission\Final /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Commercial"
mkdir $ProjectName\Commercial
Write-Verbose "Removing Inheritance from $ProjectName\Commercial"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Commercial /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Commercial with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Commercial /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Commercial with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Commercial /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Commercial with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Commercial /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate"
mkdir $ProjectName\Estimate
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate\Subcontractors"
mkdir $ProjectName\Estimate\Subcontractors
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate\Engineering"
mkdir $ProjectName\Estimate\Engineering
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate\Construction-Commissioning"
mkdir $ProjectName\Estimate\Materials
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate\Panel Shop"
mkdir $ProjectName\Estimate\"Panel Shop"
Write-Verbose "Removing Inheritance from $ProjectName\Estimate"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Estimate with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Estimate\Materials"
Write-Verbose "Removing Inheritance from $ProjectName\Estimate\Subcontractors"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Subcontractors /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Estimate\Subcontractors with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Subcontractors /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Subcontractors with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Subcontractors /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Subcontractors with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Subcontractors /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Estimate\Engineering"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Engineering /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Estimate\Engineering with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Engineering /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Engineering with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Engineering /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Engineering with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Engineering /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Estimate\Construction-Commissioning"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Materials /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Estimate\Construction-Commissioning with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Construction-Commissioning /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Construction-Commissioning with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Construction-Commissioning /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Construction-Commissioning with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\Construction-Commissioning /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Estimate\Panel Shop"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\"Panel Shop" /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Estimate\Panel Shop with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\"Panel Shop" /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Panel Shop with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\"Panel Shop" /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Estimate\Panel Shop with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Estimate\"Panel Shop" /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Bid Documents"
mkdir $ProjectName\"Bid Documents"
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Bid Documents\Addendums-Clarifications"
mkdir $ProjectName\"Bid Documents\Addendums-Clarifications"
Write-Verbose "Removing Inheritance from $ProjectName\Bid Documents"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents" /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Bid Documents with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents" /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Bid Documents with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents" /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Removing Inheritance from $ProjectName\Bid Documents\Addendums-Clarifications"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents\Addendums-Clarifications" /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Bid Documents\Addendums-Clarifications with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents\Addendums-Clarifications" /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Bid Documents\Addendums-Clarifications with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents\Addendums-Clarifications" /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Bid Documents\Addendums-Clarifications with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Bid Documents\Addendums-Clarifications" /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Site Visit"
mkdir $ProjectName\"Site Visit"
Write-Verbose "Removing Inheritance from $ProjectName\Site Visit"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Site Visit" /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Site Visit with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Site Visit" /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Site Visit with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Site Visit" /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Site Visit with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\"Site Visit" /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Administration"
mkdir $ProjectName\Administration
Write-Verbose "Creating $ClientName\Proposals\Active\$ProjectName\Administration\Correspondence"
mkdir $ProjectName\Administration\Correspondence
Write-Verbose "Removing Inheritance from $ProjectName\Administration"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Administration with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Administration with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Removing Inheritance from $ProjectName\Administration\Correspondence"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration\Correspondence /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName\Administration\Correspondence with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration\Correspondence /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Administration\Correspondence with (CI)(OI)(RD)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration\Correspondence /GRANT "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName\Administration\Correspondence with (CI)(OI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Proposals\Active\"$ProjectName\Administration\Correspondence /GRANT "tfa.Energy.RWED:(CI)(OI)(M)"
#