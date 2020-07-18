
This repo holds both Azure Data Studio and .NET interactive notebooks

There are a number of notebooks in this repository split into two types

## Jupyter .NET interactive Notebooks

These can be found in the [following folder](notebooks/dotNETNotebooks). To run these notebooks will require installing Anaconda, dotnet interactive following the instructions at https://sqldbawithabeard.com/2020/02/07/new-net-notebooks-are-here-powershell-7-notebooks-are-here/  

They are all dotnet PowerShell Notebooks with one that shows using C# and Pwsh in the same notebook

There are notebooks to explore dbatools making use of some docker containers  

- [Introduction](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/01-Introduction.ipynb)
- [Backups and Restore](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/02-BackupsRestores.ipynb)
- [Availability Groups](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/03AvailabilityGroups.ipynb)
- [Logins and Users](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/04-LoginsAndUsers.ipynb)
- [Extended Events](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/05-ExtendedEvents.ipynb)
- [Agent Jobs](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbatools/06-AgentJobs.ipynb)

 and dbachecks using the same container image
 
 - [Introduction](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbachecks/01-dbachecks-Intro.ipynb)
 - [Quick Examples](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbachecks/02-dbachecks-Quick%20Examples.ipynb)
 - [Simple Configurations](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbachecks/03-dbachecks%20-%20Simple%20configurations.ipynb)
 - [Saving Configurations](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbachecks/04-dbachecks-SavingConfigurations.ipynb)
 - [Creating Power Bi](https://github.com/SQLDBAWithABeard/JupyterNotebooks/blob/master/notebooks/dotNETNotebooks/dbachecks/05%20-%20Creating%20the%20PowerBi.ipynb)
 
 as well as some generic PowerShell ones and Azure

## Azure Data Studio Notebooks

These require Azure Data Studio and will install python and required packages on first start.  

There are SQL and PowerShell notebooks split into various directories
- [Agent](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Agent)
- [Audit](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Audit)
- [Azure](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Azure)
- [Brent Ozar scripts](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Brent%20Ozar)
- [dbachecks](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/dbachecks)
- [Extended Events](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Extended%20Events)
- [OS](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/OS)
- [Query Store](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Query%20Store)
- [SSIS](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/SSIS)
- [Statistics](https://github.com/SQLDBAWithABeard/JupyterNotebooks/tree/master/notebooks/NotDotNet/Statistics)


# JupyterNotebooks
This will hold the Jupyter Notebooks and work with Binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/SQLDBAWithABeard/JupyterNotebooks/master?urlpath=lab)
