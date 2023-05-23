#############################
#Brother Universal Printer 2#
#############################
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$DriverName = "Brother MFC-L8900CDW series"
#West Printer
$portName = "IP_10.1.104.70_2"
$PortAddress = "10.1.104.70"
#South Printer
$portName2 = "IP_10.1.104.71_2"
$PortAddress2 = "10.1.104.71"
#North Printer
$portName3 = "IP_10.1.104.72_2"
$PortAddress3 = "10.1.104.72"


###################
#Staging Drivers   #
###################
Write-Output "Staging Drivers"
pnputil.exe /add-driver "$psscriptroot\Drivers\BRPRC16A.INF" /install

#######################
#Installing Drivers   #
#######################

Write-Output "Installing Drivers"
Add-PrinterDriver -Name $DriverName

##########################################################
#Install Printerport | check if the port already exist   #
##########################################################
$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $checkPortExists) 
{
Add-PrinterPort -name $portName -PrinterHostAddress $PortAddress
} elseif ($checkPortExists) {
    Write-Error "Printe Does not exist"
}

$checkPortExists2 = Get-Printerport -Name $portname2 -ErrorAction SilentlyContinue
if (-not $checkPortExists2) 
{
Add-PrinterPort -name $portName2 -PrinterHostAddress $PortAddress2
}

$checkPortExists3 = Get-Printerport -Name $portname3 -ErrorAction SilentlyContinue
if (-not $checkPortExists3) 
{
Add-PrinterPort -name $portName3 -PrinterHostAddress $PortAddress3
}

####################################
#Check if PrinterDriver Exists     #
####################################
Write-Output "Checking for Drivers"
$printDriverExists = Get-PrinterDriver -name $DriverName -ErrorAction SilentlyContinue


##################
#Install Printer #
##################

Write-Output "Installing Printers"
if ($printDriverExists)
{
Write-Output "Installing $($portName)"
Add-Printer -Name "TN-WEST-PRINTER" -PortName $portName -DriverName $DriverName
Write-Output "Installing $($portName2)"
Add-Printer -Name "TN-SOUTH-PRINTER" -PortName $portName2 -DriverName $DriverName
Write-Output "Installing $($portName3)"
Add-Printer -Name "TN-NORTH-PRINTER" -PortName $portName3 -DriverName $DriverName
}
else
{
Write-Warning "Printer Driver not installed"
}

Write-Output Done.
Exit 0