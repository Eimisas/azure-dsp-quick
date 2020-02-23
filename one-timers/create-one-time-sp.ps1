Import-Module Az.Resources # Imports the PSADPasswordCredential object

Connect-AzAccount

$ServicePrincipalName = "dsp-quick-sp"
$credentials = New-Object Microsoft.Azure.Commands.ActiveDirectory.PSADPasswordCredential -Property @{ StartDate = Get-Date; EndDate = Get-Date -Year 2024; Password = "<PASSWORD>" }
New-AzAdServicePrincipal -DisplayName $ServicePrincipalName -PasswordCredential $credentials

