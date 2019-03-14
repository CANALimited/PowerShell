<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.159
	 Created on:   	03/14/2019 11:32 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA IT
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

New-TransportRule -Name "T004: SPF Validation" -Priority 1`
-HeaderContainsMessageHeader "Authentication-Results"`
							 -HeaderContainsWords "spf=TempError", "spf=PermError", "spf=None", "spf=Neutral", "spf=SoftFail", "spf=Fail"`
							 -ApplyHtmlDisclaimerLocation "Prepend"`
							 -ApplyHtmlDisclaimerText "
WARNING: The sender of this email could not be validated and may not match the person in the ""From"" field.
"
