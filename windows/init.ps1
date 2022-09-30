if (-Not (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	echo "This script must be executed from an Administrator PowerShell session."
	Exit
}

echo "==> Installing choco..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Auto-approve all choco installations
choco feature enable -n=allowGlobalConfirmation

echo "==> Installing choco packages..."
choco install `
	git `
	vscode `
	curl `
	vscode `
	terraform

$DownloadsPath = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

echo "==> Installing 1Password 8..."
Invoke-WebRequest -Uri "https://downloads.1password.com/win/1PasswordSetup-latest.BETA.exe" -OutFile "$DownloadsPath\1PasswordSetup-latest.BETA.exe"
& "$DownloadsPath\1PasswordSetup-latest.BETA.exe" --silent

echo "==> Installing Tower..."
Invoke-WebRequest -Uri "https://www.git-tower.com/download/windows" -OutFile "$DownloadsPath\Tower.exe"
& "$DownloadsPath\Tower.exe" --silent
