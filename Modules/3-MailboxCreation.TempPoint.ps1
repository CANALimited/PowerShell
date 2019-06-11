<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.163
	 Created on:   	06/10/2019 9:19 AM
	 Created by:   	admjustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


$username = Something
$MailDatabase = MailboxDBBronze #MailboxDBBronze,MailboxDBSilver,MailboxDBGold

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://mail.cana.ca/PowerShell/ -Authentication Kerberos -Credential $UserCredential

Import-PSSession $Session -DisableNameChecking

Enable-Mailbox -identity $username -Database $MailDatabase

Remove-PSSession $Session