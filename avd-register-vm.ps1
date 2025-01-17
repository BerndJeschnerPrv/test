#$tenantId = "c35be448-8739-4400-95cc-6118b202831d"
#$subscriptionId = "48d06275-1662-474e-a930-81e27f4c773a"
$resourceGroupName = "RG-JS-AVDdemo4"
$hostPoolName = "vdpool-avd-001"
$vmName = $env:COMPUTERNAME

# Install the necessary module
Install-Module -Name Az.DesktopVirtualization -Force -AllowClobber

# Login using Managed Identity
Connect-AzAccount -Identity

# Generate a registration key for the host pool
$registrationInfo = New-AzWvdRegistrationInfo -ResourceGroupName $resourceGroupName -HostPoolName $hostPoolName -ExpirationHours 24

# Register the VM to the host pool
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Azure/RDS-Templates/master/wvd-templates/host-pool-registration.ps1" -OutFile "C:\host-pool-registration.ps1"
powershell -ExecutionPolicy Bypass -File "C:\host-pool-registration.ps1" -RegistrationToken $registrationInfo.RegistrationToken

