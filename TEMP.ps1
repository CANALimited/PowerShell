<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.156
	 Created on:   	11/30/2018 11:18 AM
	 Created by:   	admJustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
Import-Module ActiveDirectory
$OUs =
"ou=CANA Limited Users,ou=CANA Group Users,dc=canagroup,dc=cana-group",
"ou=CANA Users,ou=CANA Group Users,dc=canagroup,dc=cana-group",
"ou=CSL Users,ou=CANA Group Users,dc=canagroup,dc=cana-group",
"ou=Utilities,ou=CANA Group Users,dc=canagroup,dc=cana-group",
"ou=SRL Users,ou=CANA Group Users,dc=canagroup,dc=cana-group",
"ou=HV Users,ou=CANA Group Users,dc=canagroup,dc=cana-group"

Foreach ($OU in $OUs)
{
	get-aduser -filter 'enabled -eq $true' -searchbase $OU -properties DisplayName, EmailAddress, TelephoneNumber, Mobile, EmployeeNumber, enabled | select displayName, EmailAddress, telephonenumber, mobile, employeeNumber | Sort-object DisplayName #| export-csv phones.csv
}


