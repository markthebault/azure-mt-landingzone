# nsg-rules - Network Security Group module

This module create two network security groups:

- Public Internal network security group
- Private Internal security group

In a case where more NGS need to be created this module should be extended and make it generic with lists of maps.

## Usage

```javascript
  prefix                        = var.prefix
  location                      = var.location
  resource_group_name           = azurerm_resource_group.netrg.name
  public_internal_subnet_id     = azurerm_subnet.public.id
  private_internal_subnet_id    = azurerm_subnet.private.id
  public_internal_cidr_allow    = "0.0.0.0/0"
  private_internal_cidr_allow   = var.public_subnet_cidr

```## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | Prefix that will be added to the name of the created resources | `any` | n/a | yes |
| location | Location of the deployment | `any` | n/a | yes |
| resource\_group\_name | Name of the resource group where the resources will be created | `any` | n/a | yes |
| public\_internal\_subnet\_id | ID of the public internal subnet | `any` | n/a | yes |
| private\_internal\_subnet\_id | ID of the private internal subnet | `any` | n/a | yes |
| public\_internal\_cidr\_allow | CIDR that will be allows from the the public internal subnet | `any` | n/a | yes |
| private\_internal\_cidr\_allow | CIDR that will be allows from the of the private internal subnet | `any` | n/a | yes |
| public\_internal\_dest\_port\_allow | Ports that will be reachable from the previously passed cidr | `string` | `"*"` | no |
| private\_internal\_dest\_port\_allow | Ports that will be reachable from the previously passed cidr | `string` | `"*"` | no |

## Outputs

| Name | Description |
|------|-------------|
| pri\_nsg | n/a |
| pub\_nsg | n/a |

