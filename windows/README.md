# Windows

* Installs Choco.
* Installs basic tools like VS Code, Git, `curl`, and 1Password.

To run the script without having to clone this repo, run the following command in an Adminstrator PowerShell session:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/florisvdg/dotfiles/d1991c340676a503d318edbc6e73011f47299e15/windows/init.ps1'))
```

## OpenSSH Server

There's an additional script here to configure the Windows machine as an OpenSSH server, so it can be used with the VS Code Remote Development extension.

The script will prompt you to enter your public key and configures that in the `administrators_authorized_keys` file.

To run the script without having to clone this repo, run the following command in an Adminstrator PowerShell session:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/florisvdg/dotfiles/2d24b75b8f5bf128cf1d1bba935892a4e6682990/windows/configure-sshd.ps1'))
```
