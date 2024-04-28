System Information and Geolocation Emailer

This PowerShell script collects detailed system information along with the device's current geolocation and sends it via email using an SMTP server. It is designed to provide administrators with comprehensive insights into the system's status and location, useful for remote diagnostics and monitoring.

Features

- **Operating System Details**: Captures the operating system version, architecture, and service pack levels.
- **System Hardware Information**: Gathers details about the CPU, memory, disks, and connected USB devices.
- **Network Configuration**: Reports on IP configurations, network adapters, and DNS settings.
- **User Information**: Lists local user accounts and currently logged-on users.
- **Running Processes and Services**: Provides information on active processes and the status of system services.
- **Geolocation**: Fetches the current geolocation of the system using the IP address.

Prerequisites

- Windows 10 or higher.
- PowerShell 5.1 or higher.
- Internet connectivity for geolocation services and email sending.
- SMTP server credentials (the script currently uses Outlook's SMTP server).

Setup

Enabling SMTP Access

For the script to send an email, you will need to configure it with valid SMTP credentials. If you have two-factor authentication enabled on your email account (recommended), you will need to generate and use an "App Password."

Generating App Password on Outlook.com

1. Log into your Microsoft account security settings.
2. Navigate to the "Advanced security options."
3. Find and click on "App passwords."
4. Generate a new app password and use this in the script.

Usage

To use this script:

1. Open PowerShell as an Administrator.
2. Navigate to the directory containing the script.
3. Run the script by typing `.\SystemInfoGeoEmailer.ps1`.

Configuration

Edit the script to include your SMTP settings and recipient email address:

```powershell
$EmailFrom = "your-email@outlook.com"
$EmailTo = "recipient-email@example.com"
$SMTPServer = "smtp.outlook.com"
$SMTPUser = "your-email@outlook.com"
$SMTPPass = "YourAppPassword"
```

Security and Privacy Considerations

- **Do not store sensitive information in public repositories.**
- **Ensure you have permission to collect and transmit data from any systems where you deploy this script.**
