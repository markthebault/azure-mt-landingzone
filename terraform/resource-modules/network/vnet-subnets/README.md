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

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group | Resource Group of vNet | `any` | n/a | yes |
| vnet\_name | The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created. | `any` | n/a | yes |
| subnets | Map of subnets with name, subnet\_cidr, and service\_endpoints. | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets | List of created subnets |

