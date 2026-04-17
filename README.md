🖥️ Windows System Snapshot Script
This repository contains a simple yet powerful Windows batch script that collects and displays key system information. It's perfect for IT professionals, system administrators, or anyone who wants a quick overview of their machine's hardware, network, and configuration details.

📋 Features
The script gathers and displays:

Current Date & Time — Useful for timestamping system checks

CPU Details — Name, number of cores, and max clock speed

User Accounts — Lists all local users on the machine

Networked Devices — Shows devices visible on the local network

System Information — OS version, architecture, memory, and more

IP Configuration — Full network adapter details

ARP Table — IP-to-MAC address mappings

Volume Information — Lists all mounted volumes

Logical Disks — Displays disk device IDs

Physical Drives — Shows physical disk details

🚀 How to Use
Clone or download this repository.

Run the batch file (.bat) by double-clicking it or executing it from the command line.

View the output directly in the console.

💡 No administrative privileges are required for most commands, but some details may be limited without them.

📁 File Overview
File Name	Description
system_snapshot.bat	Main batch script to run system diagnostics
🛠️ Requirements
Windows OS (Tested on Windows 10 and above)

Command Prompt (CMD)

📌 Notes
This script uses built-in Windows commands like wmic, net, systeminfo, and ipconfig.

Output is displayed in the terminal; you can redirect it to a file if needed:

system_snapshot.bat > snapshot.txt

📜 License
This project is open-source and available under the MIT License.
