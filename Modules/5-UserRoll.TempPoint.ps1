<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.163
	 Created on:   	06/11/2019 11:08 AM
	 Created by:   	admjustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Write-Verbose "Importing Scripts"
Write-Debug "Importing *.PS1 from \\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\Templates\"
$ImportTemplateModules = Get-ChildItem -Path "\\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\Templates\*.ps1" -Recurse -Force -exclude "*.TempPoint.ps1"
Write-Debug "Importing *.PS1 from \\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser"
$ImportTemplateModules += Get-ChildItem -Path "\\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\CreateUser.ps1" -Force #-exclude "*.ps1"
foreach ($TemplateModule in $ImportTemplateModules)
{
	Write-Debug "Importing $TemplateModule"
	Import-Module $TemplateModule
}
Write-Verbose "Done Importing Scripts"
Write-Debug "Done Importing Scripts"

$AdminCredentials = Get-Credential -Message "Credential are required for access the Domain Controller, File server and Exchange server"
$UserName = Read-Host "Enter the Username of the User"
$UserRoll = Read-Host "Enter the role for $UserName"


$session = New-PSSession -ComputerName $DomainController1 -Credential $AdminCredentials
Invoke-Command $session -Scriptblock { Import-Module ActiveDirectory }
Import-PSSession -Session $session -DisableNameChecking -module ActiveDirectory

"Hello {0} {1}" -f $UserRoll,$UserName

Remove-PSSession $Session
