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

