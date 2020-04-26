# **Resource Modules: Network Security Group**

This creates a Network Security Group with the specified security rules.


```javascript

## Common variables
    resource_group = module.vnet.vnet_rg_name
    subnet_ids = module.vnet-subnets-hub.subnet_ids
    subnet_names = module.vnet-subnets-hub.subnet_names

    nsg_rules = [
        {
            name = "testRule1"
            priority = 100
            direction = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "80"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule2"
            priority = 110
            direction = "Inbound"
            access                     = "Deny"
            protocol                   = "Tcp"
            source_port_range          = "3389"
            destination_port_range     = "3389"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule3"
            priority = 100
            direction = "Outbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "80"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        },
        {
            name = "testRule4"
            priority = 110
            direction = "Outbound"
            access                     = "Deny"
            protocol                   = "Tcp"
            source_port_range          = "3389"
            destination_port_range     = "3389"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    ]
```

