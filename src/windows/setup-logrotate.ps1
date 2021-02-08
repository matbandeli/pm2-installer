Write-Host "=== Adding Log Rotation ==="

# Check connectivity to registry.npmjs.org
node src\tools\npm-online.js

if ($? -eq $True) {

  $logrotate_package = "$(node src/tools/echo-dependency.js pm2-logrotate)"

  Write-Host "Installing $logrotate_package online.."

  pm2 install $logrotate_package --silent

} else {

  Write-Host "pm2-logrotate is already in the offline installed pm2"
  
}

pm2 save --force

Write-Host "=== Adding Log Rotation Complete ==="
