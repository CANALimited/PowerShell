#Set the Share name
$ShareName="ITStorage-JustinTEST"

#Set the discription for the Share
$ShareDiscription="CHV-Project-Jobs"

#Set the Source path
$SourcePath="E:\IT Storage\Justin"

#Set destination path
$DestinationPath="R:\IT Storage\Justin"

#Set file server name
$FileServer="VCANAFILE-01"

#Set the FQDN
$FQDN="canagroup.cana-group"

#Set the DFS Root
$DFSRoot="business"


function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

## If PASSED administrator privileges check
If (Test-Administrator -eq $True) {
       Write-Verbose "Running user does have administrator privileges!"}

 ## If FAILED administrator privileges check
 Else {Write-host "Running user" -NoNewline
        Write-host " Does Not " -ForegroundColor Red -NoNewline
        Write-host "have administrator privileges!"
        Write-host "Operation is aborting!"
        
        Exit
        
        }


Remove-SmbShare -Name $ShareName  -Confirm:$false | out-null #Removes the share from windows, forces confirm
Write-Verbose "Removing Share $ShareName" 
Set-DfsnFolderTarget -Path "\\$FQDN\$DFSRoot\$ShareName" -TargetPath "\\$FileServer\$ShareName" -State Offline | out-null # Offlining the DFS share, but leaving it intact
Write-Verbose "Disabling DFS Share \\$FQDN\$DFSRoot\$ShareName" 
$ROBOCOPYOPTIONS = @("/e","/zb","/r:1","/w:1","/copyall","/v") | out-null ## Robocopy is dumb and will only accept verables for everything, or nothing
$ROBOCOPYLOG = "/log:R:\Logs\$ShareName.txt"                   | out-null ## Setting the varables for the switches and logfile location
robocopy "$SourcePath" "$DestinationPath" $ROBOCOPYOPTIONS $ROBOCOPYLOG | out-null # Running robocopy
Write-Verbose "Running robocopy of $SourcePath to $DestinationPath.  Logs written to $ROBOCOPYLOG" 
New-SmbShare -Name $ShareName -Path $DestinationPath -Description $ShareDiscription -Confirm:$false | out-null # Recreating the new shares
Write-Verbose "Creating Share $ShareName" 
Grant-SmbShareAccess –Name $ShareName –AccountName Everyone –AccessRight Full -Force | out-null # Setting the Share permissions to Everyone Full
Write-Verbose "Setting Share $ShareName access to Everyone to Full" 
Set-DfsnFolderTarget -Path "\\$FQDN\$DFSRoot\$ShareName" -TargetPath "\\$FileServer\$ShareName" -State Online | out-null # Setting the DFS share to online
Write-Verbose "Enabling DFS Share \\$FQDN\$DFSRoot\$ShareName" 