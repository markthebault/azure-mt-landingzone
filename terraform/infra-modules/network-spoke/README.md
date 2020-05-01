# Spoke Network

This creates a Virtual Network as a Spoke in a Hub and Spoke network.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Peering | [network/vnet-peering](../../resource-modules/network/vnet-peering/README.md) |

## Usage

```javascript

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
| rg\_name | Name of the Resource Group | `any` | n/a | yes |
| region | Geographic region resource will be deployed into | `any` | n/a | yes |
| vnet\_name | Name of the Hub Vnet | `any` | n/a | yes |
| hub\_vnet\_name | Name of the Hub Vnet | `any` | n/a | yes |
| hub\_vnet\_rg | Name of the resource group where the hub vnet is | `any` | n/a | yes |
| hub\_to\_spoke\_name | Name of the Peering from hub to spoke | `any` | n/a | yes |
| spoke\_to\_hub\_name | Name of the Peering from spoke to hub | `any` | n/a | yes |
| nsg\_name | Name of the NSG | `any` | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | `list` | n/a | yes |
| subnets\_spoke | Map of subnets with name, subnet\_cidr, and service\_endpoints. | `list` | n/a | yes |
| nsg\_rules\_public | List of NSG rules | `list` | `[]` | no |
| nsg\_rules\_private | List of NSG rules | `list` | `[]` | no |
| nsg\_rules\_data | List of NSG rules | `list` | `[]` | no |
| allow\_forwarded\_traffic | Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true. | `bool` | `true` | no |
| hub\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `true` | no |
| hub\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `bool` | `false` | no |
| spoke\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | `bool` | `true` | no |
| spoke\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow\_gateway\_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | `bool` | `false` | no |
| tags | Tags to be added to resources | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_spoke | Generated spoke vnet |
| spoke\_rg | Generated spoke resource group |
| vnet\_subnets | List of spoke subnets resource |
| vnet\_hub\_to\_spoke\_peering | Peering between hub and spoke vnet |

