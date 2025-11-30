Connect-ExchangeOnline

# USE THE Distribution List EMAIL HERE
$GroupName = "distributionlistname@yourdomain.com"

# ALL DISPLAY NAMES
$DisplayNames = @(
    "Tseno Stamenov"
    "Tseno Tsenov"
    "Tseno Stoyanov"
)

foreach ($name in $DisplayNames) {

    $user = Get-ExoRecipient -Filter "DisplayName -eq '$name'"

    if ($null -eq $user) {
        Write-Host "NOT FOUND: $name" -ForegroundColor Red
        continue
    }

    Add-DistributionGroupMember -Identity $GroupName -Member $user.PrimarySmtpAddress -ErrorAction SilentlyContinue
    Write-Host "ADDED: $name" -ForegroundColor Green
}
