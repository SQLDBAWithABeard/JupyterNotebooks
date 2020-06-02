
<#
docker run -v C:\mssql\Backups\KEEP\:/var/opt/mssql/backup/ -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password0!" -e "MSSQL_AGENT_ENABLED=true" -p 15599:1433 --name beard2019 -d mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04 

# create sqladmin and disable SA

docker stop beard2019

docker commit beard2019 beard2019image

# base image created :-0

docker start beard2019
docker commit beard2019 sqldbawithabeard/dbachecksdemo
docker push sqldbawithabeard/dbachecksdemo:1.0.1
docker push sqldbawithabeard/dbachecksdemo:latest
#>

#region Set Defaults
$cred = Import-Clixml -Path D:\Creds\THEBEARDROB\sqladmin.cred

$instanceSMOsa = Connect-DbaInstance -SqlInstance 'localhost,15599' -SqlCredential sa

$sqladminPassword = ConvertTo-SecureString 'dbatools.IO' -AsPlainText -Force 
New-DbaLogin -SqlInstance $instanceSMOsa -Login sqladmin -SecurePassword $sqladminPassword -DefaultDatabase master -Force
Set-DbaLogin -SqlInstance $instanceSMOsa -Login sqladmin -AddRole sysadmin 

$instanceSMO = Connect-DbaInstance -SqlInstance 'localhost,15599' -SqlCredential $cred

$PSDefaultParameterValues = @{
    "*dba*:SqlCredential"            = $cred
    "*dba*:SourceSqlCredential"      = $cred
    "*dba*:DestinationSqlCredential" = $cred
    "*dba*:SqlInstance"              = $instanceSMO
}

$salogin = Get-DbaLogin -SqlInstance $instanceSMO -Login sa 
$salogin.Disable()
$salogin.Rename('OldSa')
$salogin.Alter()
Get-DbaLogin -SqlInstance $instanceSMO -Login sa 
Get-DbaLogin -SqlInstance $instanceSMO -Login Oldsa 
#endregion

#region Install community tools
Install-DbaMaintenanceSolution -Database master -BackupLocation '/var/opt/mssql/backup/' -CleanupTime 248 -LogToTable -InstallJobs

Install-DbaWhoIsActive -Database master 

Install-DbaFirstResponderKit -Database master 

#endregion

#region users

#region DBAs
$DBAs = @{
    Name     = 'William Durkin'
    UserName = 'wdurkin'
}, @{
    Name     = 'Gianluca Sartori'
    UserName = 'gsartori'
}, @{
    Name     = 'André Kamman'
    UserName = 'akamman'
}, @{
    Name     = 'Chrissy LeMaire'
    UserName = 'clemaire'
}, @{
    Name     = 'Shawn Melton'
    UserName = 'smelton'
}, @{
    Name     = 'Cláudio Silva'
    UserName = 'csilva'
}, @{
    Name     = 'Jonathan Allen'
    UserName = 'fatherjack'
}, @{
    Name     = 'Andy Levy'
    UserName = 'alevy'
}, @{
    Name     = 'John Martin'
    UserName = 'jamrtin'
}, @{
    Name     = "Shane O'Neill"
    UserName = 'soneill'
}, @{
    Name     = 'Tracy Boggiano'
    UserName = 'tboggiano'
}, @{
    Name     = 'thebeard'
    UserName = 'thebeard'
}

$Password = ConvertTo-SecureString -AsPlainText 'NopeNoPasswordhere1!' -Force

$DBAs.ForEach{
    New-DbaLogin -SqlInstance $instanceSMO -Login $psitem.UserName -SecurePassword $Password -DefaultDatabase master 
    Set-DbaLogin -SqlInstance $instanceSMO -Login $psitem.UserName -AddRole sysadmin
}
#endregion

#region Apps
$Apps = @{
    Name     = 'Beard App 1'
    UserName = 'beardapp1'
}, @{
    Name     = 'Beard App 2'
    UserName = 'beardapp2'
}, @{
    Name     = 'Beard App 3'
    UserName = 'beardapp3'
}, @{
    Name     = 'Beard App 4'
    UserName = 'beardapp4'
}, @{
    Name     = 'Beard App 5'
    UserName = 'beardapp5'
}, @{
    Name     = 'Beard App 6'
    UserName = 'beardapp6'
}, @{
    Name     = 'Beard App 7'
    UserName = 'beardapp7'
}, @{
    Name     = 'Beard App 8'
    UserName = 'beardapp8'
}

$Apps.ForEach{
    New-DbaLogin -SqlInstance $instanceSMO -Login $psitem.UserName -SecurePassword $Password -DefaultDatabase tempdb 
}
#endregion

#region Support
$Support = @{
    UserName = 'Support1'
}, @{
    UserName = 'Support2'
}, @{
    UserName = 'Support3'
}, @{
    UserName = 'Support4'
}, @{
    UserName = 'Support5'
}, @{
    UserName = 'Support6'
}

$Support.ForEach{
    New-DbaLogin -SqlInstance $instanceSMO -Login $psitem.UserName -SecurePassword $Password -DefaultDatabase tempdb 
}

#endregion

#region Reporting
$Reporting = @{
    UserName = 'Reporting1'
}, @{
    UserName = 'Reporting2'
}, @{
    UserName = 'Reporting3'
}, @{
    UserName = 'Reporting4'
}
$Reporting.ForEach{
    New-DbaLogin -SqlInstance $instanceSMO -Login $psitem.UserName -SecurePassword $Password -DefaultDatabase tempdb 
}
#endregion
#endregion

#region Databases

Restore-DbaDatabase -Path /var/opt/mssql/backup/\AdventureWorks2017.bak
Restore-DbaDatabase -Path /var/opt/mssql/backup/\WideWorldImporters-Full.bak
Restore-DbaDatabase -Path /var/opt/mssql/backup/\NorthWind.bak 
Restore-DbaDatabase -Path /var/opt/mssql/backup/\pubs.bak

#endregion

#need to run maintenance solution script ot create the jobs - need to raise a bug for this
$instanceSMO = Connect-DbaInstance -SqlInstance 'localhost,15599' -SqlCredential $cred
$PSDefaultParameterValues = @{
    "*dba*:SqlCredential"            = $cred
    "*dba*:SourceSqlCredential"      = $cred
    "*dba*:DestinationSqlCredential" = $cred
    "*dba*:SqlInstance"              = $instanceSMO
}

$job = New-DbaAgentJob -Job "The Beard is Important" -Description "This Job must never fail" 
New-DbaAgentJobStep -Job $job -StepName "Run this SQL" -Subsystem TransactSql -Command "SELECT 1/0" -Database pubs 

(Get-DbaAgentJob).Start()


Invoke-DbcCheck -SqlInstance 'localhost,15599' -SqlCredential $cred -Check FailedJob

$query = "EXEC msdb.dbo.sp_add_operator @name=N'SQLAdmins', @enabled=1, @email_address=N'SQLAdmins@TheBeard.local'"
Invoke-DbaQuery -Query $query

$TigerTeamalertsSql = 'D:\OneDrive\Documents\GitHub\Older\tigertoolbox\MaintenanceSolution\6_Agent_Alerts.sql'

Invoke-DbaQuery -File $TigerTeamalertsSql

$AlertsSql = 'D:\OneDrive\Documents\GitHub\Older\SQLScripts\SQL\03 - Set up SQL Alerting for SQL Errors 016 to 025.sql'
Invoke-DbaQuery -File $alertsSql

Get-DbaAgentAlert

Get-Command -Module dbatools *xe*

Get-DbaXESessionTemplate -Pattern '15 Second IO Error' | Import-DbaXESessionTemplate 
Set-DbaSpConfigure -ConfigName BlockedProcessThreshold -Value 5
Get-DbaXESessionTemplate -Pattern 'Blocked Process Report' | Import-DbaXESessionTemplate
Get-DbaXESessionTemplate -Pattern 'Stored Procedure Parameters' | Import-DbaXESessionTemplate

Set-DbaSpConfigure  -Name 'OptimizeAdhocWorkloads' -Value 1
Set-DbaSpConfigure  -Name 'RemoteDacConnectionsEnabled' -Value 1
Set-DbaSpConfigure -Name 'DefaultBackupCompression' -Value 1