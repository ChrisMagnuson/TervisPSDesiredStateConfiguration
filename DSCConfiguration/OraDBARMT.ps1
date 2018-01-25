Configuration OraDBARMT {
    param (
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$Computername
    )
    Import-DscResource –Module PSDesiredStateConfiguration

    Node $Computername
    {
        WindowsFeature SNMP
        {
            Ensure = “Present”
            Name = “SNMP-Service”
            IncludeAllSubFeature = $true
        }
        Registry SNMP-PermittedManagers
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers"
            ValueType = "String"
            ValueName = "2"
            ValueData = "orion.tervis.prv"
        }
        Registry SNMP-ValidCommunities
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\Validcommunities"
            ValueType = "DWORD"
            ValueName = "ttComStr201"
            ValueData = "4"
        }
        Registry RemoteApps-Install
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
            ValueType = "String"
            ValueName = "RDApp"
            ValueData = "rundll32.exe tsworkspace,WorkspaceSilentSetup c:\windows\system32\Remoteapps.wcx"
        }
        Group AdministratorsGroup
        {
            GroupName = 'Administrators'
            Ensure = "Present"
            MembersToInclude = "tervis\domain admins"
        }
    }
}

