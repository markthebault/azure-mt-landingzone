# **Infrastructure Modules: Hub Network**

## Description

This TF module creates a Virtual Network for use as a the Hub in a Hub and Spoke network.  

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Virtual Network | [network/vnet](../../resource-modules/network/vnet/README.md)|
| Subnets| [network/vnet-subnets](../../resource-modules/network/vnet-subnets/README.md) |
| Network Security Group | [network/nsg](../../resource-modules/network/nsg/README.md) |
| VNet Gateway | [network/vnet-gateway](../../resource-modules/network/vnet-gateway/README.md)|

## Usage
```javascript
rg_name = "clz-test-rg"
vnet_name = "def-vnet"
gwip_name = "def-gwip"
gw_name = "def-gw"
nsg_name = "def-nsg"
vnet_address_ranges = ["10.0.0.0/16"]
subnets_hub = [
  {
    name        = "GatewaySubnet"
    subnet_cidr = "10.0.100.0/27"
  },
  {
    name        = "public"
    subnet_cidr = "10.0.1.0/24"
  }
]
nsg_rules_public = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  },
  {
    name                       = "RDP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  },
]  
client_address_spaces = ["192.168.0.0/24"]
vpn_client_protocols  = ["IkeV2", "OpenVPN"]
certificate_data= "MIIJ5g....."
region = "WestEurope"


tags = {
  test = true
}

```



