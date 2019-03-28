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

Write-Debug "Importing *.PS1 from \\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\Templates\"
$ImportTemplateModules = Get-ChildItem -Path "\\canagroup.cana-group\business\IT Storage\Scripts\CANA-Justin\PowerShell\Modules\CANANewUser\Templates\*.ps1" -Recurse -Force
foreach ($TemplateModule in $ImportTemplateModules)
{
	Write-Debug "Importing $TemplateModule"
	Import-Module $TemplateModule
}
Write-Debug "Done Importing Scripts"

#This function will take the $FirstName & #SirName and convert it to the username SirName+First Letter of First Name#
function New-MakeUsername ()
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
function Search-ValidateUserName
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
	
	if ($script:UserName -match "\s")
	{
		Write-Debug "Matched whitespace"
		write-verbose "This User Name contains a white space"
		Write-Verbose "Removing whitespace from username $($script:UserName)"
		$script:UserName = $script:UserName -replace '(\s)', ''
		Write-Debug "Removed whitespace"
		Write-Verbose "Username is now $($script:UserName)"
	}
	if ($script:UserName -match "-")
	{
		Write-Debug "Username has DASH in it"
		Write-Information "The User Name $($script:UserName) contains a dash"
		Write-Verbose "Username is $($script:UserName)"
		Write-Debug "Cool, don't care about DASHES"
	}
	Write-Debug "Passed IFs on Username"
	Write-Verbose "Username $($script:UserName) is OK!"
	Write-Debug "Done Check-ValidateUserName"

	
	
	
	
}

#This function will check if the $script:UserName exists.  If it does it will add the 2nd letter from the $FirstName to the end of the $script:UserName#
	function Submit-UserName ()
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
	
	Write-Verbose $script:UserName
	Write-Debug $script:UserName
	Write-Debug "Opening PSSession with $($RemoteDC)"
	Invoke-Command -Session $script:RemoteDC -ScriptBlock {
	$DCUsername = $script:UserName
			try
		{
			Write-Debug "Checking with Active Directory for $($DCUsername)"
				$namecheck = get-aduser -filter { samaccountname -like $DCUsername }
			}
			catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
			{ }
		
			Write-Debug "AD replied, checking if True or False"
			if ($namecheck.Enabled -eq $true)
			{
			
			
			Write-Verbose "UserName $($DCUsername) is in use $($namecheck.Enabled)"
			#$DCUserName = $DCSirName + $DCFirstName.substring(0, 2)
			#Write-Verbose "trying username $DCUserName"
			#Write-Debug "trying username $DCUserName"
			Write-Verbose "Exiting from Check-UserName"
				Exit
				
			}
			
			else
			{
			Write-Verbose "$DCUsername is avalable"
			Write-Debug "$DCUsername is avalable"
			}
		
		
	}
	Write-Debug "Closing PSSession with Exit-PSSession"
	Exit-PSSession
	Write-Debug "Closed PSSession"
	Write-Debug "Done Check-UserName"
}






function Connect-DomainController
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
	If ($DC1 = $false)
	{
		Write-Debug "$($DomainController1) is unavialable"
		Write-Debug "Test-Connection was $($DC1)"
		Write-Debug "Trying $($DomainController2)"
		If ($DC2 = $false)
		{
			Write-Debug "No provided Domain Controllers connectable"
			Write-Error "No provided Domain Controllers connectable"
			Write-Debug "Exiting!"
			Exit
		}
		Else
		{
			Write-Debug "$($DomainController2) is aviablable"
			Write-Debug "Setting RemoteDC to $($DomainController2)"
			$RemoteDC = $DomainController2
		}
	}
	Else
	{
		Write-Debug "$($DomainController1) is aviablable"
		Write-Debug "Setting RemoteDC to $($DomainController1)"
		$RemoteDC = $DomainController1
	}
		
	Write-Debug "Requesting Username\Password"
	$PSCredUser = Read-Host "Username to connect to $($DomainController1 )"
	$PSCredPass = Read-Host -AsSecureString "Password to connect to $($DomainController1)"
	Write-Debug "Making Cerdentials to pass to New-PSSession"
	$PSCred = new-object -typename System.Management.Automation.PSCredential -argumentlist $PSCredUser, $PSCredPass
	Write-Debug "Calling NewPSSession"
	$script:RemoteDC = New-PSSession -ComputerName $DomainController1 -Credential $PSCred
	Write-Debug "NewPSSession established"
	Write-Debug "Done Enter-DomainController"
	
}

function Connect-Exchange
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


