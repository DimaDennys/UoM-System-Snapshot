echo off
setlocal

DISM /Online /Export-Driver /Destination:C:\DriversBackup

endlocal
pause