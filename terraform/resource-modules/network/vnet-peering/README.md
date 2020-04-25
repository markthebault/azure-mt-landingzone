# **Resource Modules: VNet Peering**
This TF module creates virtual network peerings between a spoke network and the hub network..



## Example Variables
```javascript
  hub_vnet_name               = module.vnet-hub.vnet_name
  hub_vnet_rg                 = module.vnet-hub.vnet_rg_name
  spoke_vnets_name            = list(module.vnet-spoke.vnet_name)
  spoke_vnets_rg              = list(module.vnet-spoke.vnet_rg_name)
  allow_forwarded_traffic     = true
  hub_allow_gateway_transit   = true
  hub_use_remote_gateways     = false
  spoke_allow_gateway_transit = true
  spoke_use_remote_gateways   = false
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm.shared\_services | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hub\_vnet\_rg | This is the resource group name for the Hub Vnet | `any` | n/a | yes |
| hub\_to\_spoke\_name | Name of the Peering from hub to spoke | `any` | n/a | yes |
| spoke\_to\_hub\_name | Name of the Peering from spoke to hub | `any` | n/a | yes |
| hub\_vnet\_id | This is the ID for the Hub Vnet | `any` | n/a | yes |
| hub\_vnet\_name | This is the Hub Vnet name | `any` | n/a | yes |
| spoke\_vnet\_rg | Spoke Vnets Resource Group to be peered with the Hub Vnet | `any` | n/a | yes |
| spoke\_vnet\_name | Spoke Vnets Name to be peered with the Hub Vnet | `any` | n/a | yes |
| spoke\_vnet\_id | Spoke Vnets ID to be peered with the Hub Vnet | `any` | n/a | yes |
| allow\_vnet\_access | Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to true. | `bool` | `true` | no |
| allow\_forwarded\_traffic | Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true. | `bool` | `true` | no |
| hub\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `any` | n/a | yes |
| hub\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `any` | n/a | yes |
| spoke\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `any` | n/a | yes |
| spoke\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_hub\_to\_spoke\_peering | Resource id for peering between hub and spoke vnet |
| vnet\_spoke\_to\_hub\_peering | Resource id for peering between spoke and hub vnet |

