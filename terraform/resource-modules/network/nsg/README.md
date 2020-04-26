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

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group | The resource group to which the resources will be deployed | `any` | n/a | yes |
| vnet\_name | Name of the Hub Vnet | `any` | n/a | yes |
| nsg\_name | Name of the Hub Vnet | `any` | n/a | yes |
| subnet\_ids | Subnets the NSG will apply to | `list` | n/a | yes |
| subnet\_names | Subnet names the NSG will apply to. Used for count | `list` | n/a | yes |
| nsg\_rules | List of NSG rules | `list` | <pre>[<br>  {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "22",<br>    "direction": "Inbound",<br>    "name": "SSH",<br>    "priority": 100,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "VirtualNetwork",<br>    "source_port_range": "22"<br>  },<br>  {<br>    "access": "Allow",<br>    "destination_address_prefix": "*",<br>    "destination_port_range": "3389",<br>    "direction": "Inbound",<br>    "name": "RDP",<br>    "priority": 110,<br>    "protocol": "Tcp",<br>    "source_address_prefix": "VirtualNetwork",<br>    "source_port_range": "3389"<br>  }<br>]</pre> | no |
| tags | Map of tags that will be applied to the VNet | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nsg | Network security group |
| nsg\_rules | List of network security group rules |

