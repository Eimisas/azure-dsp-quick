  
Import-Module Az.Resources

function Connect-Account($AzAppId, $TenantId, $SubscriptionId) {
    $password = Get-Content "$PSScriptRoot/secrets/pass.in" | ConvertTo-SecureString 
    $psCred = New-Object System.Management.Automation.PSCredential($AzAppId , $password)
    $Null = Connect-AzAccount -Credential $psCred -TenantId $TenantId  -ServicePrincipal 
    $Null = Set-AzContext -SubscriptionId $SubscriptionId
}