import-module activedirectory
$TMinus30 = [datetime]::Now.AddDays(-30).ToFileTime()
$Domains = 'canagroup.cana-group'
$ServerHT = @{}
$Servers = ForEach($Domain in $Domains){Get-ADObject -LDAPFilter "(&(objectCategory=computer)(name=*))" -Server $Domain | ?{$_.lastLogonTimestamp -gt $TMinus30}}
$Servers.DNSHostName | %{$ServerHT.Add($_,$Null)}
ForEach($Server in ($Servers | ?{$(Test-Connection $_.DNSHostName -Count 1 -Quiet)})){
    Try{
        $GMembers = Get-WmiObject -ComputerName $Server -Query "SELECT * FROM win32_GroupUser WHERE GroupComponent = ""Win32_Group.Domain='$Server',Name='Administrators'"""
        $Members = $GMembers | ?{$_.PartComponent -match 'Domain="(.+?)",Name="(.+?)"'}|%{[PSCustomObject]@{'Domain'=$Matches[1];'Account'=$Matches[2]}}
    }
    Catch{
        $group = [ADSI]("WinNT://$Server/Administrators,group") 
        $GMembers = $group.psbase.invoke("Members")
        $Members = $GMembers | ForEach-Object {[PSCustomObject]@{'Domain'='';'Account'=$_.GetType().InvokeMember("Name",'GetProperty', $null, $_, $null)}}
    }

    $ServerHT.$Server = $Members
}

$ServerHT.keys|%{"`n"+("="*$_.length);$_;("="*$_.length)+"`n";$ServerHT.$_|%{"{0}{1}" -f $(If($_.Domain){$_.Domain+"\"}), $_.Account}}