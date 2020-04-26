# **Infrastructure Modules: Spoke Network**

## Description

This TF module creates a Virtual Network for use as a Spoke in a Hub and Spoke network.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Peering | [network/vnet-peering](../../resource-modules/network/vnet-peering/README.md) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| rg\_name | Name of the Resource Group | string | n/a | yes |
| region | Geographic region resource will be deployed into | string | n/a | yes |
| vnet\_name | Name of the Hub Vnet | string | n/a | yes |
| hub\_to\_spoke\_name | Name of the Peering from hub to spoke | string | n/a | yes |
| spoke\_to\_hub\_name | Name of the Peering from spoke to hub | string | n/a | yes |
| nsg\_name | Name of the NSG | string | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | list | n/a | yes |
| tier | The tier of a VNet, e.g HUB, or SPK | string | `"spk"` | no |
| subnets\_spoke | Map of subnets with name, subnet_cidr, and service_endpoints. | list | n/a | yes |
| nsg\_rules\_edge | List of NSG rules | list | n/a | yes |
| nsg\_rules\_application | List of NSG rules | list | n/a | yes |
| nsg\_rules\_data | List of NSG rules | list | n/a | yes |
| storage\_account\_name | Storage account that contains Remote Backend, e.g. terraformdata24321 | string | n/a | yes |
| container\_name | Storage account container that contains Remote Backend, e.g. tfstate | string | n/a | yes |
| shared\_state\_key | Key for the shared services State file, e.g. shared-services.tfstate | string | n/a | yes |
| access\_key | access key for the storage account that contains the Remote Backend | string | n/a | yes |
| allow\_forwarded\_traffic | Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true. | string | `"true"` | no |
| hub\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | string | n/a | yes |
| hub\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | string | n/a | yes |
| spoke\_allow\_gateway\_transit | Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. | string | n/a | yes |
| spoke\_use\_remote\_gateways | Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false. | string | n/a | yes |
| tags | Tags to be added to resources | map | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_spoke\_name | Generated spoke vnet name |
| vnet\_spoke\_id | Resource id of created spoke vnet |
| vnet\_spoke\_rg | Generated spoke resource group name |
| vnet\_subnets\_spoke\_id | List of spoke subnets resource ids |
| vnet\_subnets\_names | List of spoke subnet names |
| vnet\_hub\_to\_spoke\_peering\_id | Resource id for peering between hub and spoke vnet |
| vnet\_spoke\_to\_hub\_peering\_id | Resource id for peering between spoke and hub vnet |

