function Get-LocalGroupMember
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$ComputerName = 'localhost',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [pscredential]$Credential
    )
    process
    {
        try
        {
            $params = @{
                'ComputerName' = $ComputerName
            }
            if ($PSBoundParameters.ContainsKey('Credential'))
            {
                $params.Credential = $Credential
            }

            $sb = {
                $group = [ADSI]"WinNT://./$using:Name"
                @($group.Invoke("Members")) | foreach {
                    $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
                }
            }
            Invoke-Command @params -ScriptBlock $sb
        }
        catch
        {
            Write-Error $_.Exception.Message
        }
    }
}

Get-ADComputer -filter * | foreach {Get-LocalGroupMember -Name 'Administrators' -ComputerName $_.Name }