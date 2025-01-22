# Install the Intune Management Extension
Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=874338" -OutFile "IntuneWinAppUtil.exe"
Start-Process -FilePath "IntuneWinAppUtil.exe" -ArgumentList "/quiet" -Wait

# Enroll the device in Intune
$EnrollmentUri = "https://enrollment.manage.microsoft.com/EnrollmentServer/Discovery.svc"
$AADTenantId = "c35be448-8739-4400-95cc-6118b202831d"  # Replace with your Azure AD tenant ID
$AADClientId = "73a55238-4241-43a2-bd01-ba1a81c374a3"  # Replace with your Azure AD client ID
$AADClientSecret = "3iF8Q~ph1jpf8Vb.aeF.wOW8~jn0hTKp6YFtRb2t"  # Replace with your Azure AD client secret

$body = @{
    "TenantId" = $AADTenantId
    "ClientId" = $AADClientId
    "ClientSecret" = $AADClientSecret
}

Invoke-RestMethod -Uri $EnrollmentUri -Method Post -Body (ConvertTo-Json $body) -ContentType "application/json"
