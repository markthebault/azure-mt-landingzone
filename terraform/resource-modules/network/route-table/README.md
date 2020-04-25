# subnet-route-table - Route Table module

This module create one route table especially used for private subnets that uses nat VMs.
This module can be attached to any subnet but the default route will point to a particular IP address.

## Usage

```javascript
  prefix              = var.prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.netrg.name
  subnet_id           = azurerm_subnet.private.id
  ip_next_hop         = module.natvm.nat_vm_nic.private_ip_address
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
| prefix | Prefix that will be added to the name of the created resources | `any` | n/a | yes |
| location | Location of the deployment | `any` | n/a | yes |
| resource\_group\_name | Name of the resource group where the resources will be created | `any` | n/a | yes |
| subnet\_id | ID of the subnet that where will the route table be attached | `any` | n/a | yes |
| ip\_next\_hop | Ip of the hop for the default route | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| route\_table | n/a |
| route\_table\_association | n/a |

