$WindowsDesiredStateConfigurationDefinitions = [PSCustomObject][Ordered]@{
    Name = "SCDPM2016"
    DSCConfigurationfile = "$PSScriptRoot\SCDPM2016.ps1"
},
[PSCustomObject][Ordered]@{
    Name = "OraDBARMT"
    DSCConfigurationfile = "$PSScriptRoot\OraDBARMT.ps1"
    DSCConfiguration = @{
        AllNodes = @(
                @{
                Nodename = "*"
                NETPath = "\\dfs-10\DisasterRecovery\Programs\Microsoft\Windows 2016 Sources\sources\sxs"
                }
        )
    }
},
[PSCustomObject][Ordered]@{
    Name = "SCDPM2016SQL"
    DSCConfigurationfile = "$PSScriptRoot\SCDPM2016SQL.ps1"
    DSCConfiguration = @{
        AllNodes = @(
                @{
                Nodename = "*"
                NETPath = "\\dfs-10\DisasterRecovery\Programs\Microsoft\Windows 2016 Sources\sources\sxs"
                }
        )
    }
},
[PSCustomObject][Ordered] @{
    Name = "WindowsFileServer"
    DSCConfigurationFile = "WindowsFileserver.ps1"
}
