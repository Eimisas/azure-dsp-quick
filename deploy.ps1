Import-Module $PSScriptRoot\connect-account.ps1
Import-Module $PSScriptRoot\dsp-components.psm1

## Get the parameters
$param = Get-Content "$PSScriptRoot\parameters.json" | Out-String | ConvertFrom-Json

## Connect Az account with service principle
$Null = Connect-Account -AzAppId $param.AzAppId -TenantId $param.TenantId -SubscriptionId $param.SubscriptionId

## Create New Resource Group
$Null = New-Rg -Name $param.ResourceGroupName -Location $param.Location

# Create New Databricks workspace
New-Databricks -WorkspaceName $param.Databricks.name `
    -PricingTier $param.Databricks.pricintTier `
    -Location $param.Location `
    -RgName $param.ResourceGroupName

# Create New Data Factory
New-DataFactory -RgName $param.ResourceGroupName `
    -Location $param.Location `
    -DataFactoryName $param.DataFactory.name

## Create New Storage    
New-Storage -RgName $param.ResourceGroupName `
    -StorageName $param.Storage.name `
    -Location $param.Location `
    -SkuName $param.Storage.skuName `
    -Kind $param.Storage.kind