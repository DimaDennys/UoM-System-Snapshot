@echo off
echo Current Date: %date% Current Time: %time%
rem

echo --------------------------------------------------------
echo wmic cpu get name, numberofcores, maxclockspeed
wmic cpu get name,numberofcores,maxclockspeed
rem

echo --------------------------------------------------------
echo net user
net user
rem

echo --------------------------------------------------------
echo net view
net view
rem

echo --------------------------------------------------------
echo systeminfo
systeminfo
rem

echo --------------------------------------------------------
echo ipconfig /all
ipconfig /all
rem

echo --------------------------------------------------------
echo arp all
arp -a
rem

echo --------------------------------------------------------
echo wmic volume list brief
wmic volume list brief
rem

echo --------------------------------------------------------
echo wmic logicaldisk get deviceid
wmic logicaldisk get deviceid
rem

echo --------------------------------------------------------
echo wmic diskdrive list brief
wmic diskdrive list brief
rem