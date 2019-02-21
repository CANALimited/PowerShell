<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.157
	 Created on:   	01/31/2019 7:06 AM
	 Created by:   	admJustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


Function Get-DisksSpace
{
    <# .SYNOPSIS Grabs Hard Drive & Mount Point space information.
	

    .DESCRIPTION Grabs Hard Drive & Mount Point space information. 

    .PARAMETER serverName Accepte 1 or more servernames, up to 50 at once. 

    .INPUTS Accepts pipline input of server names 

    .OUTPUTS SystemName, Name, SizeIn[KB|MB|GB], FreeIn[KB|MB|GB], PercentFree, Label 

    .NOTES Originally from https://sqlvariant.com/2017/05/finding-free-space-per-drive-mount-point-in-powershell/. 

    .LINK None. 

    .EXAMPLE PS> Get-DisksSpace localhost "MB" | ft
        
    .EXAMPLE
        Get-DisksSpace localhost | Out-GridView

    .EXAMPLE
        Get-DisksSpace localhost | ft

    .EXAMPLE
        Get-DisksSpace localhost | where{$_.PercentFree -lt 20} | Format-Table -AutoSize


    #>	
	
	
	[cmdletbinding()]
	param
	(
        <#[Parameter(Mandatory)]#>		
		[Parameter(mandatory, ValueFromPipeline = $true, ValueFromPipelinebyPropertyname = $true)]
		[ValidateCount(1, 50)]
		[string[]]$Servername = 'localhost',
		[Parameter()]
		[ValidateSet('KB', 'MB', 'GB')]
		[string]$unit = "GB"
	)
	process
	{
		$measure = "1$unit"
		
		Get-WmiObject -computername $serverName -query "
select SystemName, Name, DriveType, FileSystem, FreeSpace, Capacity, Label
  from Win32_Volume
 where DriveType = 2 or DriveType = 3" `
		| select SystemName,
				 Name,
				 @{ Label = "SizeIn$unit"; Expression = { "{0:n2}" -f ($_.Capacity/$measure) } },
				 @{ Label = "FreeIn$unit"; Expression = { "{0:n2}" -f ($_.freespace/$measure) } },
				 @{ Label = "PercentFree"; Expression = { "{0:n2}" -f (($_.freespace / $_.Capacity) * 100) } },
				 Label
	}
} Get-DisksSpace localhost | ft