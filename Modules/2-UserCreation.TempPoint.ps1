<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.163
	 Created on:   	06/04/2019 12:42 PM
	 Created by:   	admjustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
$AdminCredentials = Get-Credential -Message "Credential are required for access the Domain Controller, File server and Exchange server"
$FirstName = Read-Host "Paste the Users First Name"
$SirName = Read-Host "Paste the Users Last Name"
$DomainController1 = Read-Host "Enter the DNS name for the Domain Controller"
$DefaultPassword = 'Welcome2cana'
$Location = 'OU=Energy,OU=CANA Group Users'
$BaseHomeFolderPath = '\\canagroup.cana-group\HomeDrive\Users'


	Write-Debug "Given name is $($GivenName)"
	Write-Debug "First name is $($FirstName)"
	Write-Debug "Last name is $($SirName)"
	Write-Debug "User name is $($UserName)"
	
	$UserName = $SirName + $FirstName.substring(0, 1)
	$UserName = $UserName.ToLower()
	
	Write-Debug "Username is now $($UserName)"
	Write-Verbose "Username is now $($UserName)"


	
	if ($UserName -match "\s")
	{
		Write-Debug "Matched whitespace"
		write-verbose "This User Name contains a white space"
		Write-Debug "Removing whitespace from username $($UserName)"
		Write-Verbose "Removing whitespace from username $($UserName)"
		$UserName = $UserName -replace '(\s)', ''
		Write-Debug "Removed whitespace"
		Write-Debug "Username is now $($UserName)"
		Write-Verbose "Username is now $($UserName)"
	}
	if ($UserName -match "-")
	{
		Write-Debug "Username has DASH in it"
		Write-Information "The User Name $($UserName) contains a dash"
		Write-Verbose "Username is $($UserName)"
		Write-Debug "Cool, don't care about DASHES"
	}
	Write-Debug "Passed IFs on Username. No irregularities"
	Write-Verbose "Username $($UserName) is OK!"
	Write-Debug "Done Check-ValidateUserName"
	

	


	
	Write-debug "Testing $($DomainController1) for connectivity"
	$DC1 = test-connection -quiet -ComputerName $DomainController1
	Write-debug "Domain Controller $($DomainController1) availability is $($DC1)"
	Write-debug "Testing $($DomainController2) for connectivity"
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


$homeFolderPath = "$BaseHomeFolderPath\$UserName"


Write-Verbose "Going to check $UserName on $RemoteDC for conflict"
Write-Debug "Going to check $UserName on $RemoteDC for conflict"
Write-Debug "Opening PSSession with $($RemoteDC)"
#Enter-PSSession -Session $RemoteSession #-ScriptBlock {
#Import-PSSession -Session $RemoteSession
Invoke-Command -ComputerName $RemoteDC -Credential $AdminCredentials -ScriptBlock {
	param (
		$RUserName,
		$RFirstName,
		$RLastName,
		$RhomeFolderPath,
		$RDefaultPassword,
		$RLocation,
		$RDomainDn
	)
	
	
	try
	{
		Write-Debug "Checking with Active Directory for $($RUserName)"
		$namecheck = get-aduser -filter { samaccountname -like '$RUserName' }
		
	}
	catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException]
	{ }
	
	Write-Debug "AD replied, checking if True or False"
	if ($namecheck.Enabled -eq $true)
	{
		
		Write-Verbose "UserName $($RUserName) is in use $($namecheck.Enabled)"
		Exit
		
	}
	else
	{
		
		Write-Verbose "R$UserName is avalable"
		Write-Debug "$RUserName is avalable"
		return $true
		
	}
	
	
		Write-Debug "First name is $($RFirstName)"
		Write-Debug "Sirname is $($RLastName)"
		Write-Debug "Middle initial is $($RMiddleInitial)"
		Write-Debug "Department is $($RDepartment)"
		Write-Debug "Title is $($RTitle)"
		Write-Debug "Manager is $($RManager)"
		
		## Find the distinguished name of the domain the current computer is a part of.
		$RDomainDn = (Get-AdDomain).DistinguishedName
		
		#region Ensure the OU the user's going into exists
		$ouDN = "$RLocation,$RDomainDn"
		if (-not (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$ouDN'"))
		{
			throw "The user OU [$($ouDN)] does not exist. Can't add a user there"
		}
		#endregion
		
		#region Ensure the group the user's going into exists
		#if (-not (Get-ADGroup -Filter "Name -eq '$DefaultGroup'"))
		#{
		#	throw "The group [$($DefaultGroup)] does not exist. Can't add the user into this group."
		#}
		#if (-not (Get-ADGroup -Filter "Name -eq '$Department'"))
		#{
		#	throw "The group [$($Department)] does not exist. Can't add the user to this group."
		#}
		
		#region Ensure the home folder to create doesn't already exist
		#$homeFolderPath = "$BaseHomeFolderPath\$UserName"
		#if (Test-Path -Path $homeFolderPath)
		#{
		#	throw "The home folder path [$homeFolderPath] already exists."
		#}
		#endregion
		
		#region Create the new user
		$NewUserParams = @{
			'UserPrincipalName' = "$RUsername@canagroup.cana-group"
			'Name'			    = $RUsername
			'GivenName'		    = $RFirstName
			'Surname'		    = $RLastName
			'DisplayName'	    = "$RFirstName $RLastName"
			'HomeDrive'		    = "H:"
			'HomeDirectory'	    = "$RhomeFolderPath\My Documents"
			#'EmployeeID'		= $EmployeeID
			'SamAccountName'    = $RUsername
			'AccountPassword'   = (ConvertTo-SecureString $RDefaultPassword -AsPlainText -Force)
			'Enabled'		    = $true
			'Path'			    = "$ouDN"
			'ChangePasswordAtLogon' = $false
		}
		Write-Verbose -Message "Creating the new user account [$($RUsername)] in OU [$($ouDN)]"
		New-AdUser @NewUserParams
		#endregion

	
	
} -ArgumentList $UserName, $FirstName, $LastName, $homeFolderPath, $DefaultPassword, $Location, $DomainDn



