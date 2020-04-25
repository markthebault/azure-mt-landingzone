# nat-vm - Nat VM module

This module create a Azure VM that does Nat. The password is generated automatically and random.

## Usage

```javascript
  prefix                  = var.prefix
  resource_group_location = var.location
  resource_group_name     = azurerm_resource_group.netrg.name
  nat_nsg_id              = module.dsp_nsg.pub_nsg.id
  nat_subnet_id           = azurerm_subnet.public.id
  tags                    = var.tags
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| tls | n/a |
| random | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | Prefix that will be added to all names | `any` | n/a | yes |
| resource\_group\_location | Location of the resource group for the nat VM | `any` | n/a | yes |
| resource\_group\_name | Name of the resource group for the nat VM | `any` | n/a | yes |
| nat\_nsg\_id | Network security group where the natvm will be deployed | `any` | n/a | yes |
| nat\_subnet\_id | Subnet where the natvm will be deployed | `any` | n/a | yes |
| vmsize | Size of the nat vm, bigger size = bigger throughput | `string` | `"Standard_DS11_v2"` | no |
| tags | n/a | `map` | `{}` | no |
| admin\_username | name of the user to ssh the VM | `string` | `"nat"` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat\_vm\_password | n/a |
| nat\_vm\_nic | n/a |
| nat\_vm | n/a |

