$pubKey = Read-Host "Provide the public key to add to the administrators_authorized_keys file"
Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value $pubKey
