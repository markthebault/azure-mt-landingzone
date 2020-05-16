subscription_id="7d6832be-fcd0-48d4-a613-8fe8b5773101"
subscription_short_name="shsvc"

governance_policies_matrix = {
    autoenroll_monitor_vm   = false
    autoenroll_netwatcher   = false

    no_public_ip_spoke      = true
    cant_create_ip_spoke    = true 
    managed_disks_only      = true
    restrict_locations      = true
    list_of_allowed_locs    = ["westeurope"]
    restrict_supported_svc  = false
    msi_location            = "westeurope"
}


tags = {   
    component="network"
}

region_short_name = "we1"
hub_cidrs = ["10.0.0.0/16"]
hub_subnets = [
    {
      name        = "GatewaySubnet"
      subnet_cidr = "10.0.100.0/27"
    },
    {
      name        = "public"
      subnet_cidr = "10.0.1.0/24"
    }
]
hub_nsg_rules_public_subnet = [
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

hub_client_address_spaces = ["192.168.0.0/24"]
hub_vpn_client_protocols = ["IkeV2", "OpenVPN"]

