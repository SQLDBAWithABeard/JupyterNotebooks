try {

    [string]$CallingScriptName = "CallingScript" #Myinvocation doesnt work in notebooks
    [string]$CallingScriptPath = 'pathto script'
    Write-Information "Begin script execution of $CallingScriptName at $CallingScriptPath."  -InformationVariable 'LogMessage' | Write-TheLog -ScriptName $CallingScriptName -LogMessage $LogMessage
    Write-TheExecutionInfo -ErrorAction 'Stop' 
}
catch {
    Throw
}
$ActivityLogScriptsToProcess = @('.\scripts\Script1.ps1','.\scripts\Script2.ps1')
[string]$TypeOfJob = 'Log'

try {
    Write-Information "Start processing $TypeOfJob scripts." -IV 'LogMessage' | Write-TheLog 

    $CountOfScripts = $ActivityLogScriptsToProcess.Count

    if ($CountOfScripts -gt 0) {
        ForEach ($Script in $ActivityLogScriptsToProcess) {
            Write-Information "Start execution of $Script." -IV 'LogMessage' | Write-TheLog  
            & $Script
            Write-Information "End execution of $Script." -IV 'LogMessage' | Write-TheLog 
        }
    }
}
catch {
    Throw
}