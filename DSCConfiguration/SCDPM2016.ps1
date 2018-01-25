﻿Configuration SCDPM2016 {
    param (
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$Computername
    )
    Import-DscResource –Module PSDesiredStateConfiguration

    Node $Computername {
        Registry MPIO1 {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\MPDEV"
            ValueType = "Multistring"
            ValueName = "MPIOSupportedDeviceList"
            ValueData = "DGC     RAID 3","DGC     RAID 5","DGC     RAID 1","DGC     RAID 0","DGC     RAID 10","DGC     VRAID","DGC     DISK","DGC     LUNZ","DELL    Universal Xport","DELL    MD38xx"
        }
        Registry MPIO2 {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\msdsm\Parameters"
            ValueType = "Multistring"
            ValueName = "DsmSupportedDeviceList"
            ValueData = "DGC     RAID 3","DGC     RAID 5","DGC     RAID 1","DGC     RAID 0","DGC     RAID 10","DGC     VRAID","DGC     DISK","DGC     LUNZ","DELL    Universal Xport","DELL    MD38xx"
        }
        Group SCDPMUserAddToAdministratorsGroup {
            GroupName = 'Administrators'
            Ensure = "Present"
            MembersToInclude = "tervis\domain admins","tervis\scdpm"
        }
    }
}
