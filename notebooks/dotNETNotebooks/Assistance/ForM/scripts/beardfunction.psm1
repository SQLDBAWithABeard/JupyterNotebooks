function Write-TheLog {

        [CmdletBinding()]
        param (
            [Parameter()]
            [ValidateNotNullOrEmpty()]
            [string]$ScriptName = $CallingScriptName, #ScriptName from calling script 

            [Parameter()]
            [ValidateNotNullOrEmpty()]
            [ValidateSet("Information", "Error", "Warning")]
            [string]$LogLevel = 'Information',

            [Parameter()]
            [ValidateNotNullOrEmpty()]
            [string]$LogFileLocation = 'C:\temp\script-Execution.log' ,

            [Parameter()]
            [ValidateNotNullOrEmpty()]
            [string[]]$LogMessage 
        )
        [PSCustomObject]@{
            ScriptName = $ScriptName
            LogDateTimeUTC = ([datetime]::Now.ToUniversalTime()).ToString("MM/dd/yyyy HH:mm")
            LogLevel = $LogLevel
            LogMessage = $LogMessage[0] #Appends one message at a time based on messages in the calling script
        } | Export-Csv -Path $LogFileLocation -Append -NoTypeInformation 
}

function Write-TheExecutionInfo {
    
        [CmdletBinding()]
        param ()
            [PSCustomObject]$LogData = Read-TheExecutionInfo
            [string]$BeginLogMsg = 'User: ' + $LogData.ExecutionUser + '. Machine: ' + $LogData.ExecutionComputer + '. Host: ' + $LogData.ExecutionHost + '. Process ID: ' + $LogData.ProcessID + '.'
            Write-Information "$BeginLogMsg" -InformationVariable 'LogMessage' | Write-TheLog -ScriptName $CallingScriptName -LogMessage $LogMessage
}

Function Read-TheExecutionInfo {

        [CmdletBinding()]
        param()
        [PSCustomObject]@{
                RuntimeUTC = ([datetime]::Now.ToUniversalTime())
                ExecutionUser = "$($env:USERDOMAIN)\$($env:USERNAME)"
                ExecutionComputer = "$env:COMPUTERNAME"
                ExecutionHost = "$($host.Name)"
                ProcessID = "$pid"
                PowerShellVersion = "$($PSVersionTable.PSVersion)"
            }
}
