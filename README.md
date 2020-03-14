# JupyterNotebooks
This will hold the Jupyter Notebooks and work with Binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/SQLDBAWithABeard/JupyterNotebooks/master?urlpath=lab)

This repo holds the Azure Data Studio and .NET interactive notebooks

There are a number of notebooks in this repository split into two types

## Jupyter .NET interactive Notebooks

These can be found in the [following folder](notebooks/dotNETNotebooks). To run these notebooks will require installing Anaconda, dotnet interactive following the instructions at https://sqldbawithabeard.com/2020/02/07/new-net-notebooks-are-here-powershell-7-notebooks-are-here/  

They are all dotnet PowerShell Notebooks

There are notebooks to explore dbatools making use of some docker containers  

- [Introduction](notebooks\dotNETNotebooks\dbatools\01-Introduction.ipynb)
- [Backups and Restore](notebooks\dotNETNotebooks\dbatools\02-BackupsRestores.ipynb)
- [Availability Groups](notebooks\dotNETNotebooks\dbatools\03AvailabilityGroups.ipynb)
- [Logins and Users](notebooks\dotNETNotebooks\dbatools\04-LoginsAndUsers.ipynb)
- [Extended Events](notebooks\dotNETNotebooks\dbatools\05-ExtendedEvents.ipynb)
- [Agent Jobs](notebooks\dotNETNotebooks\dbatools\06-AgentJobs.ipynb)

 and dbachecks using the same container image
 
 - [Introduction](notebooks\dotNETNotebooks\dbachecks\01-dbachecks-Intro.ipynb)
 - [Quick Examples](notebooks\dotNETNotebooks\dbachecks\02-dbachecks-Quick Examples.ipynb)
 - [Simple Configurations](notebooks\dotNETNotebooks\dbachecks\03-dbachecks - Simple configurations.ipynb)
 - [Saving Configurations](notebooks\dotNETNotebooks\dbachecks\04-dbachecks-SavingConfigurations.ipynb)
 - [Creating Power Bi](notebooks\dotNETNotebooks\dbachecks\05 - Creating the PowerBi.ipynb)
 
 as well as some generic PowerShell ones and Azure

## Azure Data Studio Notebooks

These require Azure Data Studio and will install python and required packages on first start.  

There are SQL and PowerShell notebooks split into various directories
- [Agent](notebooks\NotDotNet\Agent)
- [Audit](notebooks\NotDotNet\Audit)
- [Azure](notebooks\NotDotNet\Azure)
- [Brent Ozar scripts](notebooks\NotDotNet\Brent Ozar)
- [dbachecks](notebooks\NotDotNet\dbachecks)
- [Extended Events](notebooks\NotDotNet\Extended Events)
- [OS](notebooks\NotDotNet\OS)
- [Query Store](notebooks\NotDotNet\Query Store)
- [SSIS](notebooks\NotDotNet\SSIS)
- [Statistics](notebooks\NotDotNet\Statistics)
