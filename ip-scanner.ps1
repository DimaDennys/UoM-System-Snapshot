# Define the range of IP addresses to scan
$ipRange = "192.168.1.1..192.168.1.254"

# Loop through each IP address in the range
foreach ($ip in $ipRange) {
    # Ping the IP address
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet

    # If the ping is successful, output the IP address
    if ($ping) {
        Write-Output "$ip is online"
    }
}

 