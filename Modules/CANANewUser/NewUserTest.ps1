<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	02/22/2019 11:39 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	Test-Module.ps1
	===========================================================================
	.DESCRIPTION
	The Test-Module.ps1 script lets you test the functions and other features of
	your module in your PowerShell Studio module project. It's part of your project,
	but it is not included in your module.

	In this test script, import the module (be careful to import the correct version)
	and write commands that test the module features. You can include Pester
	tests, too.

	To run the script, click Run or Run in Console. Or, when working on any file
	in the project, click Home\Run or Home\Run in Console, or in the Project pane, 
	right-click the project name, and then click Run Project.
#>


#Explicitly import the module for testing
Import-Module "\\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\CANANewUser.psm1" -force

Write-Host "Hello World"

$GivenName = "Dan"
$FirstName = "Justin"
$SirName = "Holmes"
$UserName = "Fun"
$DomainController1 = "vcana-dc01"
$DomainController2 = "vcana-dc02"

Get-Command -Module CANANewUser
MakeUsername -FirstName $FirstName -SirName $SirName -Verbose

Check-ValidateUserName
Enter-DomainController $DomainController1 $DomainController2
Check-UserName $RemoteDC $UserName