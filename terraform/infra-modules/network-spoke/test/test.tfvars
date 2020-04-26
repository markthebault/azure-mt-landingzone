rg_name = "spk-rg"
region = "westeurope"
vnet_name = "spk-vnet"

hub_to_spoke_name = "hub2spk"
spoke_to_hub_name = "spk2hub"

vnet_address_ranges = ["10.2.0.0/16"]

subnets_spoke = [
    {
        name        = "public"
      subnet_cidr = "10.2.0.0/24"
    },
    {
        name        = "private"
      subnet_cidr = "10.2.1.0/24"
    },
    {
        name        = "data"
      subnet_cidr = "10.2.2.0/24"
    }
]
nsg_name = "spk-nsg"
nsg_rules = [
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
    }
]  


// In order to test you need ot have an existing VNET with the following details or update those details to your existing vnet
hub_vnet_name = "default-vnet"
hub_vnet_rg   = "mth-static-stuff"

tags = {
  test = true
}