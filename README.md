# Azure-dsp-quick

Repository for ejztech.com blog post ([here](https://www.google.com))

In order to run it:

* Pull the repo.
* Create `parameters.json` file in root directory with following format.

```
{
    "SubscriptionId": "<<<Subscription ID>>>",
    "TenantId":"<<<Tenant or Directory ID>>>",
    "ResourceGroupName": "simple-dsp-rg",
    "AzAppId": "<<<service principal ID>>>",
    "Location": "West Europe",
    "Databricks": {
        "name": "simple-dsp-dbr",
        "pricintTier": "standard"
    },
    "DataFactory":{
        "name": "simple-dsp-adf"
    },
    "Storage":{
        "name": "simpledspstorage",
        "skuName": "Standard_RAGRS",
        "kind": "StorageV2"
    }
}
```

* Create `secrets` folder for password encryption.
* All set. Follow the blog post! :) 