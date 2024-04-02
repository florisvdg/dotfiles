# Ensure $env:ProgramData\ssh\administrators_authorized_keys exists
New-Item -ItemType Directory -Force -Path $env:ProgramData\ssh; New-Item -ItemType File -Path $env:ProgramData\ssh\administrators_authorized_keys -ErrorAction SilentlyContinue

# Set right permissions for administrators_authorized_keys file
icacls.exe "$env:ProgramData\ssh\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"

# Install OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Allow inbound OpenSSH server connections on port 22
New-NetFirewallRule -DisplayName "OpenSSH.Server" -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow

# Configure sshd to be started automatically
Get-Service -Name sshd | Set-Service -StartupType Automatic

# Start sshd
Start-Service sshd
