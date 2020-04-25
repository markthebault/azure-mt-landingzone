variable "resource_group" {
  description = "The resource group to which the resources will be deployed"
}

variable "virtual_network" {
  description = "The virtual network for the firewall"
}

variable "firewall_name" {
  description = "This is the name for the firewall"
  
}

variable "subnet_address_range" {
  description = "This is the CIDR range for the firewall subnet"
  
}

variable "firewall_public_ip_name" {
  description = "This is the name for the Public IP required for the firewall"
  
}

variable "fw_ip_configuration_name" {
  description = "This is the name for the Public IP configuration required for the firewall"
  
}

variable "ip_allocation_method" {
  description = "The public ip allocation method (static or dynamic)"
  
}

variable "ip_sku" {
  description = "The public ip sku"
  
}

variable "firewall_rules_nrc_name" {
  description = "An NRC rule name for the firewall"
  
}

variable "firewall_rules_nrc_priority" {
  description = "NRC rule priority for the firewall"
  
}

variable "firewall_rules_nrc_action" {
  description = "NRC rule action for the firewall"
  
}

variable "address_prefix_spoke1" {
  description = "This is the CIDR address prefix for spoke1"
  
}

variable "address_prefix_spoke2" {
  description = "This is the CIDR address prefix for spoke2"
  
}

variable "nrc_rule_spoke1to2_name" {
  description = "NRC rule name for Spoke1 to Spoke2"
  
}

variable "nrc_rule_spoke1to2_dest_ports" {
  description = "NRC ports to forward for Spoke1 to Spoke2"
  
}

variable "nrc_rule_spoke1to2_protocols" {
  description = "NRC protocols for Spoke 1 to Spoke 2"
  
}

variable "nrc_rule_spoke2to1_name" {
  description = "NRC rule name for Spoke2 to Spoke2"
  
}

variable "nrc_rule_spoke2to1_dest_ports" {
  description = "NRC ports to forward for Spoke2 to Spoke1"
  
}

variable "nrc_rule_spoke2to1_protocols" {
  description = "NRC protocols for Spoke 2 to Spoke 1"
  
}

variable "tags" {
  description = "Map of tags that will be applied to the VNet"
  default = {}
}
