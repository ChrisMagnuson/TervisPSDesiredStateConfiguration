Configuration SCDPM2016 {
    param (
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$Computername
    )
    Import-DscResource –Module PSDesiredStateConfiguration

    Node $Computername {
        Group SCDPMUserAddToAdministratorsGroup {
            GroupName = 'Administrators'
            Ensure = "Present"
            MembersToInclude = "tervis\domain admins","tervis\scdpm"
        }
    }
}
