try {
    [string]$CallingScriptName = $MyInvocation.MyCommand.Name #Detect current script name for logging
    [string]$CallingScriptPath = $PSScriptRoot #Detect current script path for logging
    Write-Information "Begin script execution of $CallingScriptName at $CallingScriptPath." -IV 'LogMessage' | Write-theLog
    Write-TheExecutionInfo -ErrorAction 'Stop' 
}
catch {
    Throw
}

if (Test-Path -Path .\scripts\Script1.ps1) {

    Write-Information "File Script1  detected." -IV 'LogMessage' | Write-TheLog
}
else{
    Write-Information "File Script1 not detected." -IV 'LogMessage' | Write-TheLog
}
if (Test-Path -Path .\scripts\Script3.ps1) {

    Write-Information "File Script3  detected." -IV 'LogMessage' | Write-TheLog
}
else{
    Write-Information "File Script3 not detected." -IV 'LogMessage' | Write-TheLog
}