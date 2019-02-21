﻿<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.156
	 Created on:   	01/09/2019 8:19 AM
	 Created by:   	admJustin
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
<#
.SYNOPSIS
This script will automatically install all avaialable windows updates on a device and will automatically reboot if needed, after reboot, windows updates will continue to run until no more updates are available.
.PARAMETER URL
User the Computer parameter to specify the Computer to remotely install windows updates on.
#>

[CmdletBinding()]
param (
	
	[parameter(Mandatory = $true, Position = 1)]
	[string[]]$computer)

#install pswindows updates module
$nugetinstall = invoke-command -ComputerName $computer -ScriptBlock { Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force }
invoke-command -ComputerName $computer -ScriptBlock { install-module pswindowsupdate -force }

invoke-command -ComputerName $computer -ScriptBlock { Import-Module PSWindowsUpdate -force }

Do
{
	
	#starts up a remote powershell session to the computer
	do
	{
		$session = New-PSSession -ComputerName $computer
		"reconnecting remotely to $computer"
		sleep -seconds 10
	}
	until ($session.state -match "Opened")
	
	#retrieves a list of available updates
	
	"Checking for new updates available on $computer"
	
	$updates = invoke-command -session $session -scriptblock { Get-wulist -verbose }
	
	#counts how many updates are available
	
	$updatenumber = ($updates.kb).count
	
	#if there are available updates proceed with installing the updates and then reboot the remote machine
	
	if ($updates -ne $null)
	{
		
		#remote command to install windows updates, creates a scheduled task on remote computer
		
		$Script = { import-module PSWindowsUpdate; Get-WindowsUpdate -AcceptAll -Install | Out-File C:\PSWindowsUpdate.log }
		
		Invoke-WUjob -ComputerName $computer -Script $Script -Confirm:$false -RunNow
		
		#Show update status until the amount of installed updates equals the same as the amount of updates available
		
		sleep -Seconds 30
		
		do
		{
			$updatestatus = Get-Content \\$computer\c$\PSWindowsUpdate.log
			
			"Currently processing the following update:"
			
			Get-Content \\$computer\c$\PSWindowsUpdate.log | select-object -last 1
			
			sleep -Seconds 10
			
			$ErrorActionPreference = 'SilentlyContinue'
			
			$installednumber = ([regex]::Matches($updatestatus, "Installed")).count
			
			$ErrorActionPreference = 'Continue'
			
		}
		until ($installednumber -eq $updatenumber)
		
		#restarts the remote computer and waits till it starts up again
		
		"restarting remote computer"
		
		Restart-Computer -Wait -ComputerName $computer -Force
		
	}
	
}
until ($updates -eq $null)

#removes schedule task from computer

invoke-command -computername $computer -ScriptBlock { Unregister-ScheduledTask -TaskName PSWindowsUpdate -Confirm:$false }

"Windows is now up to date on $computer"
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
<#
.SYNOPSIS
This script will automatically install all avaialable windows updates on a device and will automatically reboot if needed, after reboot, windows updates will continue to run until no more updates are available.
.PARAMETER URL
User the Computer parameter to specify the Computer to remotely install windows updates on.
#>

[CmdletBinding()]
param (
	
	[parameter(Mandatory = $true, Position = 1)]
	[string[]]$computer)

#install pswindows updates module
$nugetinstall = invoke-command -ComputerName $computer -ScriptBlock { Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force }
invoke-command -ComputerName $computer -ScriptBlock { install-module pswindowsupdate -force }

invoke-command -ComputerName $computer -ScriptBlock { Import-Module PSWindowsUpdate -force }

Do
{
	
	#starts up a remote powershell session to the computer
	do
	{
		$session = New-PSSession -ComputerName $computer
		"reconnecting remotely to $computer"
		sleep -seconds 10
	}
	until ($session.state -match "Opened")
	
	#retrieves a list of available updates
	
	"Checking for new updates available on $computer"
	
	$updates = invoke-command -session $session -scriptblock { Get-wulist -verbose }
	
	#counts how many updates are available
	
	$updatenumber = ($updates.kb).count
	
	#if there are available updates proceed with installing the updates and then reboot the remote machine
	
	if ($updates -ne $null)
	{
		
		#remote command to install windows updates, creates a scheduled task on remote computer
		
		$Script = { import-module PSWindowsUpdate; Get-WindowsUpdate -AcceptAll -Install | Out-File C:\PSWindowsUpdate.log }
		
		Invoke-WUjob -ComputerName $computer -Script $Script -Confirm:$false -RunNow
		
		#Show update status until the amount of installed updates equals the same as the amount of updates available
		
		sleep -Seconds 30
		
		do
		{
			$updatestatus = Get-Content \\$computer\c$\PSWindowsUpdate.log
			
			"Currently processing the following update:"
			
			Get-Content \\$computer\c$\PSWindowsUpdate.log | select-object -last 1
			
			sleep -Seconds 10
			
			$ErrorActionPreference = 'SilentlyContinue'
			
			$installednumber = ([regex]::Matches($updatestatus, "Installed")).count
			
			$ErrorActionPreference = 'Continue'
			
		}
		until ($installednumber -eq $updatenumber)
		
		#restarts the remote computer and waits till it starts up again
		
		"restarting remote computer"
		
		Restart-Computer -Wait -ComputerName $computer -Force
		
	}
	
}
until ($updates -eq $null)

#removes schedule task from computer

invoke-command -computername $computer -ScriptBlock { Unregister-ScheduledTask -TaskName PSWindowsUpdate -Confirm:$false }

"Windows is now up to date on $computer"

