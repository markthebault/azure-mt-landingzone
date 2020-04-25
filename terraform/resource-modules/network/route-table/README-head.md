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
