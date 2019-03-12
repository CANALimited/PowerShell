<#	
	.NOTES
	===========================================================================
	 Created on:   	02/19/2019 11:58 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	CANANewUser.pms1
	-------------------------------------------------------------------------
	 Module Name: CANANewUser
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>





function Write-InVerboseMode
{
	[CmdletBinding()]
	Param
	(
		[parameter(Position = 0, Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$text
	)
	Process
	{
		Write-Verbose $text
	}
}

#This function will take the $FirstName & #SirName and convert it to the username SirName+First Letter of First Name#
function MakeUsername ()
{
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)]
		[string]$GivenName,
		[parameter(Mandatory=$true)]
		[string]$FirstName,
		[parameter(Mandatory=$true)]
		[string]$SirName,
		[parameter(Mandatory=$false)]
		[string]$UserName

		)
		
	Write-Debug "Given name is $($GivenName)"
	Write-Debug "First name is $($FirstName)"
	Write-Debug "Last name is $($SirName)"
	Write-Debug "User name is $($UserName)"
	
	$UserName = $SirName + $FirstName.substring(0, 1)
	$UserName = $UserName.ToLower()
	
	Write-Debug "User name is now $($UserName)"
	Write-Verbose "User name is now $($UserName)"
	#Write-Debug "Moving to function ValidateUserName"
	
}

#This function will check the username for whitespace or dashs.  White space will be removed, dashs just throw an information warning (as requested)#
function Check-ValidateUserName
{
	
	#$UserName = $UserName.ToLower()
	if ($UserName -match "\s") { write-verbose "This User Name contains a white space" }
	if ($UserName -match "-") { Write-Information "The User Name $($UserName) contains a dash" }
	Write-Verbose '$UserName'
	
	$UserName = $UserName -replace '(\s)', ''
	
	Write-Verbose $UserName
	
	
}

#This function will check if the $UserName exists.  If it does it will add the 2nd letter from the $FirstName to the end of the $UserName#
	function Check-UserName ()
	{
	[CmdletBinding()]
	param (

	)
	
	Write-Host $UserName
		Invoke-Command -Session $RemoteDC -ScriptBlock {
			
			try
			{
				$namecheck = get-aduser -filter { samaccountname -like $UserName }
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
	}






function Enter-DomainController
{
	<#
	.SYNOPSIS
		Tests and check domain controllers
	.VERSION
		0.1
	
	#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)]
		[string]$DomainController1 = $args[0],
		[parameter(Mandatory = $false)]
		[string]$DomainController2 = $args[1]
	)

	Write-debug "Testing $($DomainController1) for connectivity"
	$DC1 = test-connection -quiet -ComputerName $DomainController1
	Write-debug "Domain Controller $($DomainController1) availability is $($DC1)"
	Write-debug "Testing $($DomainController1) for connectivity"
	$DC2 = test-connection -quiet -ComputerName $DomainController2
	Write-debug "Domain Controller $($DomainController2) availability is $($DC2)"
	$script:RemoteDC = New-PSSession -ComputerName $DomainController1 -Credential canagroup\admjustin

}


