<#	
	.NOTES
	===========================================================================
	 Created on:   	08/20/2019 8:11 AM
	 Created by:   	Justin Holmes
	 Organization: 	CANA
	 Filename:     	Energy-ProjectFolders.ps1
	===========================================================================
	.DESCRIPTION
		This file will setup a project folder in the requested Client directory.
#>

$ProjectName = Read-host -message "Please enter the projects name"
$ClientName = @(Get-ChildItem \\canagroup.cana-group\business\Energy\Clients | Out-GridView -Title 'Choose a file' -PassThru)

#-----
# Setting path location so that this script can be run remotly
#
Set-Location -Path "\\canagroup.cana-group\business\Energy\Clients\$ClientName\Active Projects\"
#
#-----

#-----
#
Write-host "Creating job folder $ProjectName"
Write-Verbose "Creating $ProjectName"
mkdir $ProjectName
Write-Verbose "Removing Inheritance from $ProjectName"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName /inheritance:r
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName /T /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to $ProjectName with (CI)(OI)(RX)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName /T /GRANT "tfa.Energy.READ:(CI)(OI)(RX)"
#-----

#-----
#
Write-Verbose "Creating $ProjectName\Procurement"
mkdir $ProjectName\Procurement
Write-Verbose "Creating $ProjectName\Procurement\Expediting"
mkdir $ProjectName\Procurement\Expediting
Write-Verbose "Creating $ProjectName\Procurement\Purchase Orders"
mkdir $ProjectName\Procurement\"Purchase Orders"
Write-Verbose "Creating $ProjectName\Procurement\Purchase Orders\RFQ"
mkdir $ProjectName\Procurement\"Purchase Orders"\RFQ
Write-Verbose "Creating $ProjectName\Procurement\Purchase Orders\RFPO"
mkdir $ProjectName\Procurement\"Purchase Orders"\RFPO
Write-Verbose "Creating $ProjectName\Procurement\Expediting"
mkdir $ProjectName\Procurement\Expediting
Write-Verbose "Creating $ProjectName\Procurement\Subcontracts"
mkdir $ProjectName\Procurement\Subcontracts
Write-Verbose "Creating $ProjectName\Procurement\Subcontracts\RFQ"
mkdir $ProjectName\Procurement\Subcontracts\RFQ
Write-Verbose "Creating $ProjectName\Procurement\Subcontracts\RFPO"
mkdir $ProjectName\Procurement\Subcontracts\RFPO
Write-Verbose "Removing Inheritance from $ProjectName\Procurement\Expediting"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Expediting /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Procurement\Expediting with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Expediting /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Procurement\Purchase Orders\RFQ"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\"Purchase Orders"\RFQ /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Procurement\Purchase Orders\RFQ with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\"Purchase Orders"\RFQ /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Procurement\Purchase Orders\RFPO"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\"Purchase Orders"\RFPO /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Procurement\Purchase Orders\RFPO with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\"Purchase Orders"\RFPO /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Procurement\Subcontracts\RFQ"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Subcontracts\RFQ /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Procurement\Subcontracts\RFQ with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Subcontracts\RFQ /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Procurement\Subcontracts\RFPO"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Subcontracts\RFPO /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Procurement\Subcontracts\RFPO with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Procurement\Subcontracts\RFPO /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
#
Write-Verbose "Creating $ProjectName\Document Control"
mkdir $ProjectName\"Document Control"
Write-Verbose "Creating $ProjectName\Document Control\ICR"
mkdir $ProjectName\"Document Control"\ICR
Write-Verbose "Creating $ProjectName\Document Control\IFR"
mkdir $ProjectName\"Document Control"\IFR
Write-Verbose "Creating $ProjectName\Document Control\Transmittals"
mkdir $ProjectName\"Document Control"\Transmittals
Write-Verbose "Creating $ProjectName\Document Control\Site Inspection"
mkdir $ProjectName\"Document Control\Site Inspection"
Write-Verbose "Creating $ProjectName\Document Control\IFC"
mkdir $ProjectName\"Document Control"\IFC
Write-Verbose "Creating $ProjectName\Document Control\RFI"
mkdir $ProjectName\"Document Control"\RFI
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\ICR"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\ICR /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\ICR with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\ICR /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\IFR"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\IFR /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\IFR with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\IFR /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\Transmittals"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\Transmittals /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\Transmittals with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control"\Transmittals /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\Site Inspection"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\Site Inspection" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\Site Inspection with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\Site Inspection" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\IFC"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\IFC" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\IFC with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\IFC" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Document Control\RFI"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\RFI" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Document Control\RFI with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Document Control\RFI" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Project Development"
mkdir $ProjectName\"Project Development"
Write-Verbose "Creating $ProjectName\Project Development\Contract"
mkdir $ProjectName\"Project Development"\Contract
Write-Verbose "Creating $ProjectName\Project Development\Final Bid Document"
mkdir $ProjectName\"Project Development\Final Bid Document"
Write-Verbose "Removing Inheritance from $ProjectName\Project Development\Contract"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Development"\Contract /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Development\Contract with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Development"\Contract /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Development\Final Bid Document"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Development\Final Bid Document" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Development\Final Bid Document with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Development\Final Bid Document" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Project Controls"
mkdir $ProjectName\"Project Controls"
Write-Verbose "Creating $ProjectName\Project Controls\Cost Control"
mkdir $ProjectName\"Project Controls\Cost Control"
Write-Verbose "Creating $ProjectName\Project Controls\Client Progress Reports"
mkdir $ProjectName\"Project Controls\Client Progress Reports"
Write-Verbose "Creating $ProjectName\Project Controls\Internal Progress Reports"
mkdir $ProjectName\"Project Controls\Internal Progress Reports"
Write-Verbose "Creating $ProjectName\Project Controls\Schedule"
mkdir $ProjectName\"Project Controls\Schedule"
Write-Verbose "Creating $ProjectName\Project Controls\Change Orders"
mkdir $ProjectName\"Project Controls\Change Orders"
Write-Verbose "Creating $ProjectName\Project Controls\Project Setup"
mkdir $ProjectName\"Project Controls\Project Setup"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Cost Control"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Cost Control" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Cost Control with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Cost Control" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Client Progress Reports"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Client Progress Reports" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Client Progress Reports with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Client Progress Reports" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Internal Progress Reports"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Internal Progress Reports" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Internal Progress Reports with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Internal Progress Reports" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Schedule"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Schedule" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Schedule with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Schedule" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Change Orders"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Change Orders" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Change Orders with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Change Orders" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Project Controls\Project Setup"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Project Setup" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Project Controls\Project Setup with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Project Controls\Project Setup" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Accounting"
mkdir $ProjectName\Accounting
Write-Verbose "Creating $ProjectName\Accounting\Progress Billing"
mkdir $ProjectName\Accounting\"Progress Billing"
Write-Verbose "Removing Inheritance from $ProjectName\Accounting\Progress Billing"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Accounting\"Progress Billing" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Accounting\Progress Billing with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Accounting\"Progress Billing" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Engineering"
mkdir $ProjectName\Engineering
Write-Verbose "Creating $ProjectName\Engineering\Project Specifications"
mkdir $ProjectName\Engineering\"Project Specifications"
Write-Verbose "Creating $ProjectName\Engineering\Geotech and Survey"
mkdir $ProjectName\Engineering\"Geotech and Survey"
Write-Verbose "Creating $ProjectName\Engineering\Client Data"
mkdir $ProjectName\Engineering\"Client Data"
Write-Verbose "Creating $ProjectName\Engineering\Equipment Data"
mkdir $ProjectName\Engineering\"Equipment Data"
Write-Verbose "Creating $ProjectName\Engineering\Bill of Materials"
mkdir $ProjectName\Engineering\"Bill of Materials"
Write-Verbose "Creating $ProjectName\Engineering\Disciplines"
mkdir $ProjectName\Engineering\Disciplines
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Scada"
mkdir $ProjectName\Engineering\Disciplines\Scada
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Primary"
mkdir $ProjectName\Engineering\Disciplines\Primary
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Civil"
mkdir $ProjectName\Engineering\Disciplines\Civil
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Protechtion - Control"
mkdir $ProjectName\Engineering\Disciplines\"Protechtion - Control"
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\CATV"
mkdir $ProjectName\Engineering\Disciplines\CATV
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Structural"
mkdir $ProjectName\Engineering\Disciplines\Structural
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Fiber"
mkdir $ProjectName\Engineering\Disciplines\Fiber
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Telecom"
mkdir $ProjectName\Engineering\Disciplines\Telecom
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Lighting"
mkdir $ProjectName\Engineering\Disciplines\Lighting
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\AC-DC"
mkdir $ProjectName\Engineering\Disciplines\AC-DC
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Gas"
mkdir $ProjectName\Engineering\Disciplines\Gas
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Building"
mkdir $ProjectName\Engineering\Disciplines\Building
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Municpality"
mkdir $ProjectName\Engineering\Disciplines\Municpality
Write-Verbose "Creating $ProjectName\Engineering\Disciplines\Transmission"
mkdir $ProjectName\Engineering\Disciplines\Transmission
Write-Verbose "Creating $ProjectName\Engineering\Studies"
mkdir $ProjectName\Engineering\Studies
Write-Verbose "Creating $ProjectName\Engineering\Studies\Grounding"
mkdir $ProjectName\Engineering\Studies\Grounding
Write-Verbose "Creating $ProjectName\Engineering\Studies\Lightning Protection"
mkdir $ProjectName\Engineering\Studies\"Lightning Protection"
Write-Verbose "Creating $ProjectName\Engineering\Studies\AC-DC"
mkdir $ProjectName\Engineering\Studies\AC-DC
Write-Verbose "Creating $ProjectName\Engineering\Studies\Insulation Coordination"
mkdir $ProjectName\Engineering\Studies\"Insulation Coordination"
Write-Verbose "Creating $ProjectName\Engineering\Studies\ARC Flash"
mkdir $ProjectName\Engineering\Studies\"ARC Flash"
Write-Verbose "Creating $ProjectName\Engineering\Studies\Ridgid Bus"
mkdir $ProjectName\Engineering\Studies\"Ridgid Bus"
Write-Verbose "Creating $ProjectName\Engineering\Studies\Transmission"
mkdir $ProjectName\Engineering\Studies\Transmission
Write-Verbose "Creating $ProjectName\Engineering\Studies\Other"
mkdir $ProjectName\Engineering\Studies\Other
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Project Specifications"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Project Specifications" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Accounting\Invoicing with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Project Specifications" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Geotech and Survey"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Geotech and Survey" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Geotech and Survey with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Geotech and Survey" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Client Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Client Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Client Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Client Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Equipment Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Equipment Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Equipment Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Equipment Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Bill of Materials"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Bill of Materials" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Bill of Materials with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\"Bill of Materials" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Scada"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Scada /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Scada with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Scada /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Primary"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Primary /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Primary with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Primary /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Civil"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Civil /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Civil with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Civil /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Protechtion - Control"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\"Protechtion - Control" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Protechtion - Control with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\"Protechtion - Control" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\CATV"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\CATV /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\CATV with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\CATV /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Structural"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Structural /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Structural with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Structural /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Fiber"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Fiber /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Fiber with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Fiber /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Telecom"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Telecom /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Telecom with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Telecom /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Lighting"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Lighting /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Lighting with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Lighting /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\AC-DC"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\AC-DC /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\AC-DC with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\AC-DC /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Gas"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Gas /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Gas with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Gas /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Building"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Building /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Building with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Building /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Municpality"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Municpality /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Municpality with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Municpality /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Disciplines\Transmission"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Transmission /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Disciplines\Transmission with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Disciplines\Transmission /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Grounding"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Grounding /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Grounding with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Grounding /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Lightning Protection"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Lightning Protection" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Lightning Protection with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Lightning Protection" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\AC-DC"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\AC-DC /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\AC-DC with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\AC-DC /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Insulation Coordination"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Insulation Coordination" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Insulation Coordination with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Insulation Coordination" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\ARC Flash"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"ARC Flash" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\ARC Flash with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"ARC Flash" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Ridgid Bus"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Ridgid Bus" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Ridgid Bus with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\"Ridgid Bus" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Transmission"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Transmission /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Transmission with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Transmission /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Engineering\Studies\Other"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Other /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Engineering\Studies\Other with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Engineering\Studies\Other /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Drawings"
mkdir $ProjectName\Drawings
Write-Verbose "Creating $ProjectName\Drawings\Drawing List"
mkdir $ProjectName\Drawings\"Drawing List"
Write-Verbose "Creating $ProjectName\Drawings\Customer In"
mkdir $ProjectName\Drawings\"Customer In"
Write-Verbose "Creating $ProjectName\Drawings\WIP"
mkdir $ProjectName\Drawings\WIP
Write-Verbose "Creating $ProjectName\Drawings\Review 1"
mkdir $ProjectName\Drawings\"Review 1"
Write-Verbose "Creating $ProjectName\Drawings\Review 2"
mkdir $ProjectName\Drawings\"Review 2"
Write-Verbose "Creating $ProjectName\Drawings\Review 3"
mkdir $ProjectName\Drawings\"Review 3"
Write-Verbose "Creating $ProjectName\Drawings\As Recorded"
mkdir $ProjectName\Drawings\"As Recorded"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\Drawing List"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Drawing List" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\Drawing List with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Drawing List" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\Customer In"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Customer In" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\Customer In with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Customer In" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\WIP"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\WIP /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\WIP with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\WIP /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\Review 1"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 1" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\Review 1 with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 1" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\Review 2"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 2" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\Review 2 with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 2" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\Review 3"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 3" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\Review 3 with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"Review 3" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Drawings\As Recorded"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"As Recorded" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Drawings\As Recorded with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Drawings\"As Recorded" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Construction"
mkdir $ProjectName\Construction
Write-Verbose "Creating $ProjectName\Construction\Safety"
mkdir $ProjectName\Construction\Safety
Write-Verbose "Creating $ProjectName\Construction\Photos"
mkdir $ProjectName\Construction\Photos
Write-Verbose "Creating $ProjectName\Construction\Locates"
mkdir $ProjectName\Construction\Locates
Write-Verbose "Creating $ProjectName\Construction\Reporting"
mkdir $ProjectName\Construction\Reporting
Write-Verbose "Creating $ProjectName\Construction\Reporting\DFR"
mkdir $ProjectName\Construction\Reporting\DFR
Write-Verbose "Creating $ProjectName\Construction\Environment"
mkdir $ProjectName\Construction\Environment
Write-Verbose "Creating $ProjectName\Construction\Quality"
mkdir $ProjectName\Construction\Quality
Write-Verbose "Creating $ProjectName\Construction\Quality\Dificiency List"
mkdir $ProjectName\Construction\Quality\"Dificiency List"
Write-Verbose "Creating $ProjectName\Construction\Quality\ITP"
mkdir $ProjectName\Construction\Quality\ITP
Write-Verbose "Creating $ProjectName\Construction\Quality\QC"
mkdir $ProjectName\Construction\Quality\QC
Write-Verbose "Creating $ProjectName\Construction\Work Package"
mkdir $ProjectName\Construction\"Work Package"
Write-Verbose "Creating $ProjectName\Construction\Work Package\Execution Plan"
mkdir $ProjectName\Construction\"Work Package\Execution Plan"
Write-Verbose "Creating $ProjectName\Construction\Work Package\Outage Request"
mkdir $ProjectName\Construction\"Work Package\Outage Request"
Write-Verbose "Creating $ProjectName\Construction\Work Package\BOM"
mkdir $ProjectName\Construction\"Work Package"\BOM
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Safety"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Safety /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Safety with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Safety /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Photos"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Photos /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Photos with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Photos /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Locates"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Locates /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Locates with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Locates /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Reporting"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Reporting /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Reporting with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Reporting /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Environment"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Environment /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Environment with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Environment /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Quality\Dificiency List"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\"Dificiency List" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Quality\Dificiency List with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\"Dificiency List" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Quality\ITP"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\ITP /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Quality\ITP with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\ITP /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Quality\QC"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\QC /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Quality\QC with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\Quality\QC /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Work Package\Execution Plan"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package\Execution Plan" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Work Package\Execution Plan with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package\Execution Plan" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Work Package\Outage Request"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package\Outage Request" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Work Package\Outage Request with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package\Outage Request" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Construction\Work Package\BOM"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package"\BOM /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Construction\Work Package\BOM with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Construction\"Work Package"\BOM /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Close Out"
mkdir $ProjectName\"Close Out"
Write-Verbose "Creating $ProjectName\Close Out\External Close"
mkdir $ProjectName\"Close Out\External Close"
Write-Verbose "Creating$ProjectName\Close Out\As-Builts"
mkdir $ProjectName\"Close Out"\As-Builts
Write-Verbose "Creating $ProjectName\Close Out\Warranty"
mkdir $ProjectName\"Close Out"\Warranty
Write-Verbose "Creating $ProjectName\Close Out\Return Data"
mkdir $ProjectName\"Close Out\Return Data"
Write-Verbose "Creating $ProjectName\Close Out\Lessons Learnt"
mkdir $ProjectName\"Close Out\Lessons Learnt"
Write-Verbose "Creating $ProjectName\Close Out\Internal Close"
mkdir $ProjectName\"Close Out\Internal Close"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\External Close"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\External Close" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\External Close with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\External Close" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\As-Builts"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out"\As-Builts /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\As-Builts with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out"\As-Builts /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\Warranty"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out"\Warranty /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\Warranty with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out"\Warranty /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\Return Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Return Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\Return Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Return Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\Lessons Learnt"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Lessons Learnt" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\Lessons Learnt with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Lessons Learnt" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Close Out\Internal Close"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Internal Close" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Close Out\Internal Close with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Close Out\Internal Close" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Meeting Minutes"
mkdir $ProjectName\"Meeting Minutes"
Write-Verbose "Creating $ProjectName\Meeting Minutes\Internal"
mkdir $ProjectName\"Meeting Minutes"\Internal
Write-Verbose "Creating $ProjectName\Meeting Minutes\External"
mkdir $ProjectName\"Meeting Minutes"\External
Write-Verbose "Removing Inheritance from $ProjectName\Meeting Minutes\Internal"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Meeting Minutes"\Internal /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Meeting Minutes\Internal with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Meeting Minutes"\Internal /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Meeting Minutes\External"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Meeting Minutes"\External /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Meeting Minutes\External with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Meeting Minutes"\External /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Correspondence"
mkdir $ProjectName\Correspondence
Write-Verbose "Removing Inheritance from $ProjectName\Correspondence"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Correspondence /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Correspondence with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Correspondence /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Regulatory"
mkdir $ProjectName\Regulatory
Write-Verbose "Removing Inheritance from $ProjectName\Regulatory"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Regulatory /inheritance:r
Write-Verbose "Granting permission for stfa.Energy.Regulatory.READ to $ProjectName\Regulatory with (CI)(OI)(RX)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Regulatory /T /GRANT "stfa.Energy.Regulatory.READ:(CI)(OI)(RX)"
Write-Verbose "Granting permission for stfa.Energy.Regulatory.RWED to $ProjectName\Regulatory with (CI)(OI)(RX,W,D)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\Regulatory /T /GRANT "stfa.Energy.Regulatory.RWED:(CI)(OI)(RX,W,D)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Testing and Commissioning"
mkdir $ProjectName\"Testing and Commissioning"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working"
mkdir $ProjectName\"Testing and Commissioning"\Working
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\CT Tests"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\CT Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\IR Scans"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\IR Scans"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\LA Tests"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\LA Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\NGR Nameplates"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\NGR Nameplates"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\PT Tests"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\PT Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\Equitment Testing\Transformer Tests"
mkdir $ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\Transformer Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\SCADA Documents"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"SCADA Documents"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\Module Pictures"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"Module Pictures"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\Load Readings Voltage Checks"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"Load Readings Voltage Checks"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\QA-QC Record Sheets"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"QA-QC Record Sheets"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\Functional Data"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\Functional Data\RAW Data"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data\RAW Data"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS\RAW Data"
mkdir $ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS\RAW Data"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final"
mkdir $ProjectName\"Testing and Commissioning"\Final
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\CT LO OHMS"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"CT LO OHMS"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\Element Test"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"Element Test"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\Functional Data"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"Functional Data"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\Load Readings Voltage Checks"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"Load Readings Voltage Checks"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\SCADA Documents"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"SCADA Documents"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\PC\Scanned QA-QC Documentation"
mkdir $ProjectName\"Testing and Commissioning"\Final\"PC"\"Scanned QA-QC Documentation"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\CT Tests"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\CT Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\IR Scans"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\IR Scans"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\LA Tests"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\LA Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\PT Tests"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\PT Tests"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\Scanned QA-QC Documentation"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Scanned QA-QC Documentation"
Write-Verbose "Creating $ProjectName\Testing and Commissioning\Final\Equitment Testing\Transformer Tests"
mkdir $ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Transformer Tests"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\CT Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\CT Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\CT Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\CT Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\IR Scans"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\IR Scans" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\IR Scans with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\IR Scans" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\LA Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\LA Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\LA Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\LA Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\NGR Nameplates"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\NGR Nameplates" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\NGR Nameplates with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\NGR Nameplates" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\PT Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\PT Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\PT Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\PT Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\Equitment Testing\Transformer Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\Transformer Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\Equitment Testing\Transformer Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"Equitment Testing\Transformer Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\SCADA Documents"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"SCADA Documents" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\SCADA Documents with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"SCADA Documents" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\Module Pictures"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Module Pictures" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\Module Pictures with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Module Pictures" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\Load Readings Voltage Checks"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Load Readings Voltage Checks" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\Load Readings Voltage Checks with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Load Readings Voltage Checks" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\QA-QC Record Sheets"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"QA-QC Record Sheets" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\QA-QC Record Sheets with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"QA-QC Record Sheets" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\Functional Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\Functional Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\Functional Data\RAW Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data\RAW Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\Functional Data\RAW Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"Functional Data\RAW Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS\RAW Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS\RAW Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS\RAW Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS\RAW Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS\RAW Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS\RAW Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Working\PC\CT LO OHMS\RAW Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Working\"PC"\"CT LO OHMS\RAW Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\PC\Element Test"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Element Test" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\PC\Element Test with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Element Test" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\PC\Functional Data"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Functional Data" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\PC\Functional Data with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Functional Data" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\PC\Load Readings Voltage Checks"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Load Readings Voltage Checks" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\PC\Load Readings Voltage Checks with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Load Readings Voltage Checks" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\PC\SCADA Documents"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"SCADA Documents" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\PC\SCADA Documents with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"SCADA Documents" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\PC\Scanned QA-QC Documentation"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Scanned QA-QC Documentation" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\PC\Scanned QA-QC Documentation with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"PC"\"Scanned QA-QC Documentation" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\CT Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\CT Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\CT Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\CT Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\IR Scans"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\IR Scans" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\IR Scans with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\IR Scans" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\LA Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\LA Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\LA Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\LA Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\PT Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\PT Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\PT Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\PT Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\Scanned QA-QC Documentation"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Scanned QA-QC Documentation" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\Scanned QA-QC Documentation with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Scanned QA-QC Documentation" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
Write-Verbose "Removing Inheritance from $ProjectName\Testing and Commissioning\Final\Equitment Testing\Transformer Tests"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Transformer Tests" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Testing and Commissioning\Final\Equitment Testing\Transformer Tests with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Testing and Commissioning"\Final\"Equitment Testing\Transformer Tests" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
Write-Verbose "Creating $ProjectName\CIP"
mkdir $ProjectName\CIP
Write-Verbose "Removing Inheritance from $ProjectName\CIP"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\CIP /inheritance:r
Write-Verbose "Granting permission for stfa.Energy.CIP.READ to $ProjectName\Regulatory with (CI)(OI)(RX)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\CIP /T /GRANT "stfa.Energy.CIP.READ:(CI)(OI)(RX)"
Write-Verbose "Granting permission for stfa.Energy.CIP.READ to $ProjectName\Regulatory with (CI)(OI)(RX,W,D)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\CIP /T /GRANT "stfa.Energy.CIP.RWED:(CI)(OI)(RX,W,D)"
#-----

#-----
Write-Verbose "Creating $ProjectName\Panel Shop"
mkdir $ProjectName\"Panel Shop"
Write-Verbose "Removing Inheritance from $ProjectName\Panel Shop"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Panel Shop" /inheritance:r
Write-Verbose "Granting permission for tfa.Energy.RWED to $ProjectName\Panel Shop with (OI)(CI)(M)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName\"Panel Shop" /GRANT "tfa.Energy.RWED:(OI)(CI)(M)"
#-----

#-----
# This is to allow MFA access to all folders again after /inheritance:r on all end folders
Write-Verbose "Granting permission for mfa.AllFolders.Full to $ProjectName with (CI)(OI)(F)"
& icacls.exe \\canagroup.cana-group\business\Energy\Clients\$ClientName"\Active Projects\"$ProjectName /T /GRANT "mfa.AllFolders.Full:(CI)(OI)(F)"
#-----