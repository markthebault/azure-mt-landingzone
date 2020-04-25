variable "resource_group" {
  description = "The resource group of the vnet"

}

variable "vnet_name" {
  description = "The name of the vnet"
}

variable "vnet_address_ranges" {
  description = "List of the ip address ranges for the vnet"
  type        = list
}

variable "tags" {
  description = "Map of tags that will be applied to the VNet"
  default = {}
}


variable "ddos_protection_plan" {
  description = "Ddos protection plan applied to the VNET"
  default = null
}

variable "dns_servers" {
  description = "List of DNS Servers passed to the VNET"
  default = []
}