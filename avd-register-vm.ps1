#$tenantId = "c35be448-8739-4400-95cc-6118b202831d"
#$subscriptionId = "48d06275-1662-474e-a930-81e27f4c773a"
$resourceGroupName = "RG-JS-AVDdemo4"
$hostPoolName = "vdpool-avd-001"
$vmName = $env:COMPUTERNAME

# Install the necessary module
Install-Module -Name Az.DesktopVirtualization -Force -AllowClobber

# Connect to Azure
Connect-AzAccount -Identity

# Register the VM with the host pool
New-AzWvdSessionHost -ResourceGroupName $resourceGroupName -HostPoolName $hostPoolName -Name $vmName -SessionHostName $vmName
