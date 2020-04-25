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

```