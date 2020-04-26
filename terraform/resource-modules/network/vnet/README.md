# **Resource Modules: Virtual Network**

## Description

This TF module can be used to create a basic virtual network.


## Example Variables
```javascript
    resource_prefix = "vnet"
    region = "westeurope"
    vnet_address_ranges = ["10.0.0.0/16"]
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
| resource\_group | The resource group of the vnet | `any` | n/a | yes |
| vnet\_name | The name of the vnet | `any` | n/a | yes |
| vnet\_address\_ranges | List of the ip address ranges for the vnet | `list` | n/a | yes |
| tags | Map of tags that will be applied to the VNet | `map` | `{}` | no |
| ddos\_protection\_plan | Ddos protection plan applied to the VNET | `map` | <pre>{<br>  "enable": false,<br>  "id": ""<br>}</pre> | no |
| dns\_servers | List of DNS Servers passed to the VNET | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_name | Generated vnet name |
| vnet\_id | vnet resource id |

