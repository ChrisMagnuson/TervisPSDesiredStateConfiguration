$ModulePath = (Get-Module -ListAvailable TervisPSDesiredStateConfiguration).ModuleBase

Get-ChildItem $ModulePath\DSCConfiguration |
ForEach-Object {
    . $_.FullName
} 

function Install-TervisDesiredStateConfiguration {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]$ComputerName,
        [Parameter(ValueFromPipelineByPropertyName)]$ApplicationName
    )
    process {
        $TempPath = $env:TEMP
        New-Item -Path "$TempPath\$ComputerName" -ItemType Directory
        & $ApplicationName -ComputerName $ComputerName -OutputPath "$TempPath\$ComputerName"
        Start-DscConfiguration -ComputerName $ComputerName -path $TempPath\$ComputerName -Wait -Verbose -Force
        Remove-Item -path $TempPath\$ComputerName -recurse -force
    }
}

function New-DSCConfigurationForSingleNode {
    param (
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]$ComputerName
    )
    @{
        AllNodes = @(
            @{
                NodeName = $ComputerName
            }
        )
    }
}