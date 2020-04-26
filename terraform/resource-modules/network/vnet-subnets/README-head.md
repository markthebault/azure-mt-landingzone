# **Resource Modules: Virtual Network Subnets**
This module will create Subnets in the specified VNet.


## Example Variables
```javascript
    resource_group = "${module.vnet.vnet_rg_name}"

    vnet_name = "${module.vnet.vnet_name}"

    subnets = [
        {
            name        = "AzureFirewallSubnet"
            subnet_cidr = "10.1.0.0/24"
        },
        {
            name        = "storage"
            subnet_cidr = "10.1.1.0/24"
            service_endpoints = "Microsoft.EventHub,Microsoft.KeyVault,Microsoft.Storage"
        }
    ]

```

