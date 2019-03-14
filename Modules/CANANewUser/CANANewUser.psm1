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
	<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
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
	<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory=$false)]
		[string]$GivenName,
		[parameter(Mandatory=$true)]
		[string]$FirstName,
		[parameter(Mandatory=$true)]
		[string]$SirName,
		[parameter(Mandatory=$false)]
		[string]$script:UserName

		)
		
	Write-Debug "Given name is $($GivenName)"
	Write-Debug "First name is $($FirstName)"
	Write-Debug "Last name is $($SirName)"
	Write-Debug "User name is $($script:UserName)"
	
	$script:UserName = $SirName + $FirstName.substring(0, 1)
	$script:UserName = $script:UserName.ToLower()
	
	Write-Debug "User name is now $($script:UserName)"
	Write-Verbose "User name is now $($script:UserName)"
	#Write-Debug "Moving to function ValidateUserName"
	
}

#This function will check the username for whitespace or dashs.  White space will be removed, dashs just throw an information warning (as requested)#
function Check-ValidateUserName
{
<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
	#$script:UserName = $script:UserName.ToLower()
	if ($script:UserName -match "\s") { write-verbose "This User Name contains a white space" }
	if ($script:UserName -match "-") { Write-Information "The User Name $($script:UserName) contains a dash" }
	Write-Verbose '$script:UserName'
	
	$script:UserName = $script:UserName -replace '(\s)', ''
	
	Write-Verbose $script:UserName
	
	
}

#This function will check if the $script:UserName exists.  If it does it will add the 2nd letter from the $FirstName to the end of the $script:UserName#
	function Check-UserName ()
{
	<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
	[CmdletBinding()]
	param (

	)
	
	Write-Host $script:UserName
	Invoke-Command -Session $RemoteDC -ScriptBlock {
		$DCFirstName = $Using:FirstName
		$DCSirName = $Using:SirName
		$DCUserName = $Using:UserName
			try
			{
				$namecheck = get-aduser -filter { samaccountname -like $DCUserName }
			}
			catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
			{ }

		
			if ($namecheck.Enabled -eq $true)
			{
				Write-Verbose "UserName is in use"
			$DCUserName = $DCSirName + $DCFirstName.substring(0, 2)
			Write-Verbose "trying username $DCUserName"

				
			}
			
			else
			{
			Write-Verbose "$DCUserName is avalable"
			}
		
		
	}
	Exit-PSSession
}






function Enter-DomainController
{
<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)]
		[string]$DomainController1 = $args[0],
		[parameter(Mandatory = $false)]
		[string]$DomainController2 = $args[1]
	)
	
	
	#If (Get-PSSession -ComputerName MyServerName | $script:RemoteDC = Connect-PSSession)
	#{}
	
	Write-debug "Testing $($DomainController1) for connectivity"
	$DC1 = test-connection -quiet -ComputerName $DomainController1
	Write-debug "Domain Controller $($DomainController1) availability is $($DC1)"
	Write-debug "Testing $($DomainController1) for connectivity"
	$DC2 = test-connection -quiet -ComputerName $DomainController2
	Write-debug "Domain Controller $($DomainController2) availability is $($DC2)"
	$script:RemoteDC = New-PSSession -ComputerName $DomainController1 -Credential canagroup\admjustin
	
}

function Enter-Exchange
{
<#
.SYNOPSIS
    
.DESCRIPTION
    
.NOTES
    
.LINK
    
.EXAMPLE
    
.EXAMPLE
    
.INPUTTYPE
   
.RETURNVALUE

.COMPONENT
#>
	[CmdletBinding()]
	param (
		[parameter(Mandatory = $true)]
		[string]$Exchange1 = $args[0],
		[parameter(Mandatory = $false)]
		[string]$Exchange2 = $args[1]
	)
	
	
	#If (Get-PSSession -ComputerName MyServerName | $script:RemoteDC = Connect-PSSession)
	#{}
	
	Write-debug "Testing $($Exchange1) for connectivity"
	$EX1 = test-connection -quiet -ComputerName $Exchange1
	Write-debug "Domain Controller $($Exchange1) availability is $($EX1)"
	Write-debug "Testing $($Exchange2) for connectivity"
	$EX2 = test-connection -quiet -ComputerName $Exchange2
	Write-debug "Domain Controller $($Exchange2) availability is $($EX2)"
	$script:RemoteEX = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://vCANAEXCH-01/PowerShell/ -Authentication Kerberos -Credential canagroup\admjustin
	
}


