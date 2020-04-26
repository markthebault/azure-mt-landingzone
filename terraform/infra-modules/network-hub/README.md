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



## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg\_name | Name of the Resource Group | `string` | n/a | yes |
| vnet\_name | Name of the Hub Vnet | `string` | n/a | yes |
| gwip\_name | Name of the Gateway Public IP | `string` | n/a | yes |
| gw\_name | Name of the Gateway | `string` | n/a | yes |
| nsg\_name | Name of the NSG | `string` | n/a | yes |
| vnet\_address\_ranges | This is a list of the ip address ranges for the vnet | `list(string)` | n/a | yes |
| subnets | Map of subnets with name, subnet\_cidr, and service\_endpoints. | `any` | n/a | yes |
| nsg\_rules\_public | List of NSG rules | `any` | n/a | yes |
| certificate\_data | Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections | `string` | `""` | no |
| client\_address\_spaces | The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation | `list(string)` | n/a | yes |
| vpn\_client\_protocols | List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN. | `list(string)` | n/a | yes |
| region | Geographic Region resource will be deployed into | `string` | n/a | yes |
| tags | Tags to be added to resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet | Hub Vnet |
| rg | Hub resource group name |
| ubnets | List of hub subnets |
| gateway | Virtual network gateway resource |
| subnets\_public\_nsg | Public network security group |

