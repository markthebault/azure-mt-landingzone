variable "resource_group" {
  description = "The resource group to which the resources will be deployed"
  
}

variable "vnet_name" {
  description = "Name of the Hub Vnet"
  
}

variable "nsg_name" {
  description = "Name of the Hub Vnet"
  
}

variable "subnet_ids" {
  description = "Subnets the NSG will apply to"
  type        = list
}

variable "subnet_names" {
  description = "Subnet names the NSG will apply to. Used for count"
  type        = list
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type        = list

  default = [
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
}

variable "tags" {
  description = "Map of tags that will be applied to the VNet"
  type        = map
}
