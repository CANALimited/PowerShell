Set-Location -Path "R:\Energy-MP\Energy-Shared\"

#-----
# Administrative
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Administrative"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative /inheritance:r /t /q
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Administrative with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative /T /Q /Grant "tfa.Energy.Administrative.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Policies\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Policies"\Active /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Policies\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Policies"\Archived /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Policies\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Policies"\Information /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Policies\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Policies"\Pending /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Procedures\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Procedures"\Active /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Procedures\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Procedures"\Archived /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Procedures\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Procedures"\Information /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Procedures\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Procedures"\Pending /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Templates\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Templates"\Active /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Templates\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Templates"\Archived /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Templates\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Templates"\Information /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Company Templates\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Company Templates"\Pending /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Marketing Materials\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Marketing Materials"\Active /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Marketing Materials\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Marketing Materials"\Archived /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Marketing Materials\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Marketing Materials"\Information /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Marketing Materials\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\"Marketing Materials"\Pending /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Standards\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\Standards\Active /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Standards\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\Standards\Archived /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Standards\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\Standards\Information /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Administrative\Standards\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Administrative\Standards\Pending /Q /Grant "tfa.Energy.Administrative.RWED:(CI)(OI)(M)"
#

#-----
#Business Development
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Business Development"
& icacls.exe R:\Energy-MP\Energy-Shared\"Business Development" /inheritance:r /t /q
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Business Development with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Business Development" /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Business Development with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Business Development" /T /Q /Grant "tfa.Energy.BusnessDevelopment.READ:(CI)(OI)(RD)"
#

#-----
#Clients
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Clients"
& icacls.exe R:\Energy-MP\Energy-Shared\Clients /inheritance:r /q
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Clients with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Clients /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Clients with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Clients /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Clients with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Clients /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Contractor Management Program
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Contractor Management Program"
& icacls.exe R:\Energy-MP\Energy-Shared\"Contractor Management Program" /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Contractor Management Program with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Contractor Management Program" /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Contractor Management Program with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Contractor Management Program" /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Clients with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Contractor Management Program" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Construction
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Construction"
& icacls.exe R:\Energy-MP\Energy-Shared\Construction /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Construction with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Construction /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Construction with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Construction /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Construction\Energy Services with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Construction\"Energy Services" /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Construction\Infrastructure with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Construction\Infrastructure /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Drafting
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Drafting"
& icacls.exe R:\Energy-MP\Energy-Shared\Drafting /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Drafting with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Drafting /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.Drafting.READ to R:\Energy-MP\Energy-Shared\Drafting with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Drafting /T /Q /Grant "tfa.Energy.Drafting.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.Drafting.RWED to R:\Energy-MP\Energy-Shared\Drafting with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Drafting\"Drafting Requests" /Q /Grant "tfa.Energy.Drafting.RWED:(CI)(OI)(M)"
#

#-----
#Engineering
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Engineering"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Engineering with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Engineering with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Administrative with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\Administrative /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Agencies with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\Agencies /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\General Specifications\Active with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"General Specifications"\Active /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\General Specifications\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"General Specifications"\Archived /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\General Specifications\Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"General Specifications"\Information /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\General Specifications\Pending with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"General Specifications"\Pending /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Guidelines with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\Guidelines /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Programs with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\Programs /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Technical Bulletins with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"Technical Bulletins" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Technical Information with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"Technical Information" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Engineering\Vendor Data with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Engineering\"Vendor Data" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Fleet
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Fleet"
& icacls.exe R:\Energy-MP\Energy-Shared\Fleet /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Fleet with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Fleet /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Fleet with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Fleet /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Fleet with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Fleet /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#HSE
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\HSE"
& icacls.exe R:\Energy-MP\Energy-Shared\HSE /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\HSE with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\HSE /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\HSE with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\HSE /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\HSE with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\HSE /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Management
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Management"
& icacls.exe R:\Energy-MP\Energy-Shared\Management /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Management with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.Management.READ to R:\Energy-MP\Energy-Shared\Management with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management /T /Q /Grant "tfa.Energy.Management.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Engineering with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\Engineering /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Energy Services with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\"Energy Services" /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Fleet with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\Fleet /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\General with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\General /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Infrastructure with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\Infrastructure /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Project Services with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\"Project Services" /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.Management.RWED to R:\Energy-MP\Energy-Shared\Management\Safety with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Management\Safety /T /Q /Grant "tfa.Energy.Management.RWED:(CI)(OI)(M)"
#

#-----
#Panel Shop
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Panel Shop"
& icacls.exe R:\Energy-MP\Energy-Shared\"Panel Shop" /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Panel Shop with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Panel Shop" /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Panel Shop with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Panel Shop" /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Panel Shop with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Panel Shop" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Temporary
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Temporary"
& icacls.exe R:\Energy-MP\Energy-Shared\Temporary /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Temporary with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\Temporary /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Temporary with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\Temporary /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Temporary with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\Temporary /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#

#-----
#Project Services
#
Write-Verbose "Removing Inheritance from R:\Energy-MP\Energy-Shared\Project Services"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services" /inheritance:r /q /t
Write-Verbose "Granting permission for mfa.AllFolders.Full to R:\Energy-MP\Energy-Shared\Project Services with (CI)(OI)(F)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services" /T /Q /Grant "mfa.AllFolders.Full:(CI)(OI)(F)"
Write-Verbose "Granting permission for tfa.Energy.READ to R:\Energy-MP\Energy-Shared\Project Services with (CI)(OI)(RD)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services" /T /Q /Grant "tfa.Energy.READ:(CI)(OI)(RD)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Administrative with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services"\Administrative /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Management Reports with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Management Reports" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Procurement\Subcontractor Management\Subcontractor Prequals with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Procurement\Subcontractor Management\Subcontractor Prequals" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Procurement\Supplier Management\Suppliers Performance with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Procurement\Supplier Management\Suppliers Performance" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Cost Control with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Cost Control" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Internal Report with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Internal Report" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Archived with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Archived" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\ISO Standards with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\ISO Standards" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Quality Forms with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Quality Forms" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Quality Manual with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Quality Manual" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Quality Policies with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Quality Policies" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Quality Procedures with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Quality Procedures" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Quality Records with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Quality Records" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Quality\Work Instructions with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Quality\Work Instructions" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Proposals\Tracking with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Proposals\Tracking" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Proposals\Resource Centre\Photos with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Proposals\Resource Centre\Photos" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Proposals\Resource Centre\Sample Proposals with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Proposals\Resource Centre\Sample Proposals" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Experiences-Capabilities with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Experiences-Capabilities" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Health Safety and Environment with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Health Safety and Environment" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Personnel with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Project Controls\Proposals\Resource Centre\Sample Write-up\Personnel" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Pre-Planning with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Pre-Planning" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Project Close-Out with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Project Close-Out" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Proposals\Resource Centre\Sample Write-up\Project Execution with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Project Execution" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
Write-Verbose "Granting permission for tfa.Energy.RWED to R:\Energy-MP\Energy-Shared\Project Services\Project Controls\Proposals\Resource Centre\Sample Write-up\Quality with (CI)(OI)(M)"
& icacls.exe R:\Energy-MP\Energy-Shared\"Project Services\Proposals\Resource Centre\Sample Write-up\Quality" /T /Q /Grant "tfa.Energy.RWED:(CI)(OI)(M)"
#