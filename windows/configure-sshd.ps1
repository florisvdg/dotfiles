# Configure OpenSSH server

# Ask for public key and add to administrators_authorized_keys file
$pubKey = Read-Host "Provide the public key to add to the administrators_authorized_keys file"
Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value $pubKey

# Set right permissions for administrators_authorized_keys file
icacls.exe "$env:ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"

# Install OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Configure sshd to be started automatically
Get-Service -Name sshd | Set-Service -StartupType Automatic

# Start sshd
Start-Service sshd
