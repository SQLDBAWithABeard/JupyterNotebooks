<#
.SYNOPSIS
This script will export all of the agent jobs to a directory per instance in the specified base directory 
You should run this file and then look at the example and run what you need  

.DESCRIPTION
This script will export all of the agent jobs to a directory per instance in the specified base directory   

.PARAMETER BaseDirectory
The base directory for the scripts

.PARAMETER SqlInstance
A SqlInstance or list of Sqlinstances

.EXAMPLE
Export-TheAgentJobs -SqlInstance $ProdInstances -BaseDirectory 'THEPATH'

Exports the Prod Instances Agent jobs to a folder
.NOTES
Initial - Rob Sewell 20/04/2020
#>
function Export-TheAgentJobs {
    Param(
        $BaseDirectory,
        $SqlInstance
    )
$PSDefaultParameterValues['Write-PSFMessage:Level'] = 'Output'
Write-PSFMessage "# Started"
Write-PSFMessage "# Processing Jobs on $SqlInstance"
foreach ($instance in $SqlInstance) {
    Write-PSFMessage "# Processing $instance"
    $instanceName = $instance.Split('.')[0]
    if (Test-Path "$BaseDirectory\$instanceName" -ErrorAction SilentlyContinue ) {
        Write-PSFMessage "## The $BaseDirectory\$instanceName folder exists"
    }
    else {
        Write-PSFMessage "## Need to create a folder for the Instance"
        $null = New-Item  "$BaseDirectory\$instanceName" -ItemType Directory
    }

    Write-PSFMessage "## Getting all of the jobs on $instance"
    $Jobs = Get-DbaAgentJob -SqlInstance $instance

    foreach ($job in $jobs) {
        Write-PSFMessage "#### Processing Job $($Job.Name)"
        # Need to replace job name illegal characters
        $JobName = $($Job.Name).Replace(':','colon').Replace('<','lessthan').Replace('>','greaterthan').Replace('*', 'star').Replace('\','slash').Replace('/','slash')
        $FilePath = "$BaseDirectory\$instanceName\$JobName" + '.sql'
        If (Test-Path $FilePath) {
            Write-PSFMessage "#### need to delete the file first"
            Remove-Item $FilePath -Force
        }
        Write-PSFMessage "#### Exporting to $instanceName\$($Job.Name).sql"
       $Null = $Job | Export-DbaScript -FilePath "$FilePath" -NoPrefix
        Write-PSFMessage "#### Finished Job $($Job.Name)"
    }
    Write-PSFMessage "# Finished $Sqlinstance"
}
Write-PSFMessage "# Finished"
}
