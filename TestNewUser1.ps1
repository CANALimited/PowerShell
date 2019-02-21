clear
#Clearing the screen because I wanna

$FirstName = $null
$LastName = $null
$ReportsTo = $null
$CompanyNumber = $null
$Username = $null
$FullName = $null
$UserCredential = $null
$ADPassword = $null
#Clearing varables for use

$exchangeserver = "vCANAExch-01" #Name of the Exchange Server
$fileserver = "vCANAFile-01" #Name of the file server
$homedrivepath = "HomeDrive\users" #Home Drive folder share and path"
$domaincontroller = "vCANA-DC01" #Domain Controller
#Setting varables for use


Write-Host "                                                                        " -BackgroundColor Red
Write-Host "                                                                        " -BackgroundColor Black
Write-Host " Administrative credentials are needed for some operations              " -BackgroundColor Black -ForegroundColor White
Write-Host " Please enter your ADM account for access to AD, File Server & Exchange " -BackgroundColor Black -ForegroundColor White
Write-Host "                                                                        " -BackgroundColor Black
Write-Host "                                                                        " -BackgroundColor Red

$UserCredential = Get-Credential 
#Writing warning and getting ADM credentials for operations

clear
#Clearing the screen again

Write-Host " /¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\"
Write-Host "|" -nonewline 
Write-Host " CANA " -foreground Yellow -nonewline 
Write-Host "New User creation scrip v0.01  |"
Write-Host " \___________________________________/"
Write-Host

$FirstName = Read-Host -Prompt 'Paste the First Name of the user'
#In put prompt Users First Name
$LastName = Read-Host -Prompt 'Paste the Lastname of the user'
#In put prompt Users Last Name
$ReportsTo = Read-Host -Prompt 'Paste who the user Reports To'
#In put prompt Reports to manager
$CompanyNumber = Read-Host -Prompt 'Enter the Company Number the user belongs to'
#In put prompt Company Number
$JobRoll = Read-Host -Prompt 'Enter the Roll the user belongs to'
#In put prompt Job roll

$ADPassword = $null
$ADPassword = Read-Host -Prompt 'Enter user password'
If ($ADPassword = $null) {$ADPassword = "Welcome2cana"; Write-Host "Using default password"}
Else {Write-Host "You set a custom password"}
write-host $ADPassword
$SecureADPassword = $ADPassword | ConvertTo-SecureString -AsPlainText -Force
write-host $SecureADPassword


#Asking for ADPassword, is no password entered (just pressing enter) using default password

$Username = $Lastname+$Firstname.substring(0,1)
#Computing username form First and Lastname
$Username = $Username.ToLower()
#making the username lowercase
$FullName = "$FirstName $LastName"
#Computing the Full name for other use

New-ADUser -name $FullName -Displayname $FullName -server $domaincontroller -path “OU=TEST,OU=CANA Limited Users,OU=CANA Group Users,DC=canagroup,DC=cana-group" -CannotChangePassword $false -ChangePasswordAtLogon $false -Company "CANA Limited" -Department "IT" -Description "Hey" -Enabled $True -HomeDirectory "$homedrivepath\$Username\My Documents" -HomeDrive "H:" -HomePage "https://mysites.cana.ca/Person.aspx?accountname=CANAGROUP%5C$username" -Manager "$ReportsTo" -PasswordNeverExpires $False -PasswordNotRequired $False -ScriptPath "logon.bat" -GivenName $FirstName -Surname $LastName -Credential $UserCredential
Add-ADGroupMember -Identity "Ace_Certificates_Sec" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "All Head Office Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "All Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "CANA Construction Commercial" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "CANA FWC Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "CANA Limited" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "CANA Lunch Special" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Email Archiving Enabled" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Est_Sec" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "IT_Sec" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "IT_Sec2" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Map.Business.Drive" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Mbx.Locates" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Printer Access RM438F-Construction Admin - Aficio 820dn Def" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Printer Access RM438P-Accounting - HP 830z Secondary" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SP.All.Construction.R" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SP.ConstructionEstimating" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SP.IT.Contribute" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SP.ViewpointERP.Contributor" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SP_IT_Staff" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SW_FM_Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SW_FWC_Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SW_Viewpoint_Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Salaried Employees" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "SurfCont-PEM" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Viewpoint Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Vista Viewpoint Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenApp75_Print_Acct_2ndFL" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenApp75_RDM" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenApp75_Users" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenApp75_Viewpoint_Prod" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenApp75_Viewpoint_Test" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "XenAppUsers" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Xenapp75_Project2010" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Xenapp75_Project2016" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "Xenapp_RDP" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "tfa.ITStorage.RWED" -Members $Username -Server $domaincontroller -Credential $UserCredential
Add-ADGroupMember -Identity "tfa.SoftwareDistribution.RWED" -Members $Username -Server $domaincontroller -Credential $UserCredential