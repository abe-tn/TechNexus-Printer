# TeamWorking-Printers
TeamWorking Printer Deployment Toolkit for Collaborators

---

This repo assumes your IT Team is using InTune to manage your windows endpoints.
If you are not using InTune the powershell scripts included should still work.

######What is in this repo?
In this repo you will find:
* Printer Drivers for the Brother MFC-L8900CDW.
_To ensure security you can download the drivers from Brothers themselves [here](https://support.brother.com/g/b/downloadend.aspx?c=us&lang=en&prod=mfcl8900cdw_all&os=10068&dlid=dlf103195_000&flang=4&type3=407)._
* Install and Uninstall script

######Creating Intunewin file
When creating the intunewin file select No when you are asked if a catalog should be created.

---

######Install Command
```powershell
powershell.exe -Executionpolicy Bypass .\install.ps1
```
######Uninstall Command
```powershell
powershell.exe -Executionpolicy Bypass .\uninstall.ps1
```

######Regex Values used to Confirm installation:
West Printer
```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\TW-WEST-PRINTER
```
South Printer
```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\TW-SOUTH-PRINTER
```
North Priner
```
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\TW-NORTH-PRINTER
```

---

These powershell scripts are based off of: 
https://call4cloud.nl/2021/07/what-about-printer-drivers/