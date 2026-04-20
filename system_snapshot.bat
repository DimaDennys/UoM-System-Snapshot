@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

:: Get current date and time for timestamping
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set mm=%%a
    set dd=%%b
    set yyyy=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hh=%%a
    set min=%%b
)
set timestamp=%yyyy%-%mm%-%dd%_%hh%-%min%

:: Output file
set outfile=system_snapshot_%timestamp%.txt

echo "System Snapshot - %timestamp% into file %outfile%"
echo. >> %outfile%

echo ==== Current Date and Time ==== >> %outfile%
echo Date: %date% >> %outfile%
echo Time: %time% >> %outfile%
echo. >> %outfile%

echo ==== CPU Details ==== >> %outfile%
powershell -Command "Get-WmiObject Win32_Processor | Select-Object Name,NumberOfCores,MaxClockSpeed | Format-List | Out-String" >> %outfile%
echo. >> %outfile%

echo ==== User Accounts ==== >> %outfile%
powershell -Command "net user" >> %outfile%
echo. >> %outfile%

echo ==== Networked Devices (ARP Table) ==== >> %outfile%
powershell -Command "arp -a" >> %outfile%
echo. >> %outfile%

echo ==== System Information ==== >> %outfile%
powershell -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Caption,Version,OSArchitecture,TotalVisibleMemorySize | Format-List | Out-String" >> %outfile%
echo. >> %outfile%

echo ==== IP Configuration ==== >> %outfile%
powershell -Command "ipconfig /all" >> %outfile%
echo. >> %outfile%

echo ==== ARP Table ==== >> %outfile%
powershell -Command "arp -a" >> %outfile%
echo. >> %outfile%

echo ==== Volume Information ==== >> %outfile%
powershell -Command "Get-WmiObject Win32_Volume | Select-Object DriveLetter,Label,FileSystem,Capacity,FreeSpace | Format-Table -AutoSize | Out-String" >> %outfile%
echo. >> %outfile%

echo ==== Logical Disks ==== >> %outfile%
powershell -Command "Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID,VolumeName,FileSystem,Size,FreeSpace | Format-Table -AutoSize | Out-String" >> %outfile%
echo. >> %outfile%

echo ==== Physical Drives ==== >> %outfile%
powershell -Command "Get-WmiObject Win32_DiskDrive | Select-Object Model,SerialNumber,Size,MediaType | Format-Table -AutoSize | Out-String" >> %outfile%
echo. >> %outfile%

echo System snapshot saved to %outfile%
pause

