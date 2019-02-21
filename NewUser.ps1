<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	02/19/2019 11:58 AM
	 Created by:   	admJustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$GivenName
$FirstName="Justin"
$SirName="Holmes"
$UserName
$namecheck



function MakeUsername ()
{
	$UserName = $SirName + $FirstName.substring(0, 1)
	ValidateUserName
}
function ValidateUserName {
	
	$UserName = $UserName.ToLower()
	if ($UserName -match "\s") { Write-host "This UserName contains a white space" }
	if ($UserName -match "-") { Write-host "This UserName contains a dash" }
	Write-Verbose $UserName
	
	$UserName = $UserName -replace '(\s)', ''
	
	Write-Verbose $UserName
	
	CheckUserName
}

function CheckUserName ()
{
	
try
	{
		$namecheck  = get-aduser -filter { samaccountname -like $UserName }
	}
	catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
	{ }
	
	if ($namecheck.Enabled -eq $true)
	{
		Write-Verbose "$UserName is in use"
		$UserName = $SirName + $FirstName.substring(0, 2)
		Write-Verbose "trying username $UserName"
		ValidateUserName
		
	}
	
	else
	{
		Write-Verbose "$UserName is avalable"
	}
	
}

MakeUsername


