# Fetch IP-based geolocation
$ipInfo = Invoke-RestMethod -Uri 'http://ipinfo.io/json'
$location = $ipInfo.loc
$ip = $ipInfo.ip

# Setup SMTP variables
$SmtpServer = 'smtp.yourserver.com'
$SmtpUser = 'your-email@yourdomain.com'
$SmtpPass = 'your-password'
$Message = "IP: $ip; Location: $location"

# Email properties
$MailMessage = New-Object System.Net.Mail.MailMessage
$MailMessage.From = 'your-email@yourdomain.com'
$MailMessage.To.Add('recipient-email@domain.com')
$MailMessage.Subject = 'Geolocation Data'
$MailMessage.Body = $Message

# Send Email
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) # Adjust port if needed
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SmtpUser, $SmtpPass)
$SMTPClient.Send($MailMessage)
