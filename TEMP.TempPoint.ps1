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
get-aduser -filter * -searchbase "ou=users,dc=adomain,dc=com" -properties Telephonenumber | select displayname, givenname, sn, telephonenumber #| export-csv phones.csv

