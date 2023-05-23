$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$DriverName = "Brother MFC-L8900CDW series"

#West Printer
$portName1 = "IP_10.1.104.70_2"
#South Printer
$portName2 = "IP_10.1.104.71_2"
#North Printer
$portName3 = "IP_10.1.104.72_2"

##################
#Remove Printer #
##################

function RemovePrinter([string]$PrinterName) {
    $printerInstallationStatus = Get-Printer $PrinterName -ErrorAction SilentlyContinue
    if ($printerInstallationStatus) {
        Remove-Printer $PrinterName -ErrorAction SilentlyContinue
        Write-Output "Printer: $($PrinterName) has been removed"

    } elseif (-not $printerInstallationStatus) {
        Write-Error "Could not remove printer $($PrinterName)"
        Exit 90234
    }
}

function RemovePort ([string]$portname){
    $checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
    if ($checkPortExists) {
        remove-printerPort -Name $portname -ErrorAction SilentlyContinue
        Write-Output "Port: $($portname) shas been removed"
    } else {
        Write-Error "Could not remove port $($portname)"
        Exit 10492
    }
}

function RemoveDriver([string]$DriverName) {
    $printDriverExists = Get-PrinterDriver -name $DriverName -ErrorAction SilentlyContinue
    if ($printDriverExists) {
        Write-Output "Driver exists. Proceeding to Remove Printer"
        # Remove Driver
        Remove-PrinterDriver $DriverName -ErrorAction SilentlyContinue
        Write-Output "Removed Printer Driver: $($DriverName)"
    }
    else {
        Write-Error "Could not find $($DriverName) or does not exist. Please Contact Support"
    }
}

#Remove Printers
RemovePrinter("TN-NORTH-PRINTER")
RemovePrinter("TN-SOUTH-PRINTER")
RemovePrinter("TN-WEST-PRINTER")

#Remove Port
RemovePort($portName1)
RemovePort($portName2)
RemovePort($portName3)

#Remove Driver
RemoveDriver("Brother MFC-L8900CDW series")
RemoveDriver("Brother Universal Printer (BR-Script3)")



Exit 0