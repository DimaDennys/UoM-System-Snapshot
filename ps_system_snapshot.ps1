# Filename: system_snapshot.ps1

# Get timestamp for filename
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outfile = "system_snapshot_$timestamp.txt"

# Collect info
$info = @()

$info += "==== Current Date & Time ===="
$info += (Get-Date).ToString()
$info += ""

$info += "==== CPU Details ===="
$info += (Get-WmiObject Win32_Processor | Select-Object Name,NumberOfCores,MaxClockSpeed | Format-List | Out-String)
$info += ""

$info += "==== User Accounts ===="
$info += (Get-LocalUser | Select-Object Name | Out-String)
$info += ""

$info += "==== Networked Devices (ARP Table) ===="
$info += (arp -a)
$info += ""

$info += "==== System Information ===="
$info += (Get-CimInstance Win32_OperatingSystem | Select-Object Caption,Version,OSArchitecture,TotalVisibleMemorySize | Format-List | Out-String)
$info += ""

$info += "==== IP Configuration ===="
$info += (ipconfig /all)
$info += ""

$info += "==== Volume Information ===="
$info += (Get-Volume | Select-Object DriveLetter,FileSystemLabel,FileSystem,SizeRemaining,Size | Format-Table -AutoSize | Out-String)
$info += ""

$info += "==== Logical Disks ===="
$info += (Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID,VolumeName,FileSystem,Size,FreeSpace | Format-Table -AutoSize | Out-String)
$info += ""

$info += "==== Physical Drives ===="
$info += (Get-WmiObject Win32_DiskDrive | Select-Object Model,SerialNumber,Size,MediaType | Format-Table -AutoSize | Out-String)
$info += ""

# Save to file with UTF8 encoding
$info | Out-File -FilePath $outfile -Encoding utf8

Write-Host "System snapshot saved to $outfile"
