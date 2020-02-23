function New-Rg ($Name, $Location) {

    Write-Host "Trying to create Resource Group ($Name)"
    $rg = Get-AzResourceGroup -Name $Name -ErrorVariable notPresent -ErrorAction SilentlyContinue
    if ($rg) {
        Write-Host "Resource Group ($Name) already exists"
        return $False
    }
    else {
        $Null = New-AzResourceGroup -Name $Name -Location $Location
        return $True
    }
}

function New-Databricks($WorkspaceName, $PricingTier, $Location, $RgName) {
    Write-Host "Deploying databricks workspace ($WorkspaceName)"
    $Null = New-AzResourceGroupDeployment -ResourceGroupName $RgName `
    -workspaceName $WorkspaceName `
    -pricingTier $PricingTier `
    -location $Location `
    -TemplateFile "$PSScriptRoot/templates/databricks.json"
    Write-Host "Databricks workspace ($WorkspaceName) deployed"
}

function New-DataFactory($RgName, $Location, $DataFactoryName) {
    Write-Host "Creating Azure Data Factory ($DataFactoryName)"
    $Null = Set-AzDataFactoryV2 -ResourceGroupName $RgName `
        -Location $Location -Name $DataFactoryName
    Write-Host "Azure Data Factory ($DataFactoryName) deployed"
}

function New-Storage($RgName, $StorageName, $Location, $SkuName, $Kind) {
    Write-Host "Creating storage ($StorageName)"
    $Null = New-AzStorageAccount -ResourceGroupName $RgName `
        -Name $StorageName `
        -Location $Location `
        -SkuName $SkuName `
        -Kind $Kind `
        -EnableHierarchicalNamespace $true
    Write-Host "Storage ($StorageName) deployed"
}

Export-ModuleMember -Function "New-*"
