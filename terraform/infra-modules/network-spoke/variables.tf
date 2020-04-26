variable "rg_name" {
  description = "Name of the Resource Group"
  
}

variable "region" {
  description = "Geographic region resource will be deployed into"
  
}

variable "vnet_name" {
  description = "Name of the Hub Vnet"
  
}

variable "hub_vnet_name" {
  description = "Name of the Hub Vnet"
}

variable "hub_vnet_rg" {
  description = "Name of the resource group where the hub vnet is"
}

variable "hub_to_spoke_name" {
  description = "Name of the Peering from hub to spoke"
  
}

variable "spoke_to_hub_name" {
  description = "Name of the Peering from spoke to hub"
  
}

variable "nsg_name" {
  description = "Name of the NSG"
  
}

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list
}

variable "subnets_spoke" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
  type        = list
}

variable "nsg_rules_public" {
  description = "List of NSG rules"
  type        = list
  default = []
}

variable "nsg_rules_private" {
  description = "List of NSG rules"
  type        = list
  default = []
}

variable "nsg_rules_data" {
  description = "List of NSG rules"
  type        = list
  default = []
}


variable "allow_forwarded_traffic" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to true."
  default     = true
}

variable "hub_allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  default = true
}

variable "hub_use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  default = false
}

variable "spoke_allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network."
  default = true
}

variable "spoke_use_remote_gateways" {
  description = "Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Only one peering can have this flag set to true. This flag cannot be set if virtual network already has a gateway. Defaults to false."
  default = false
}

variable "tags" {
  description = "Tags to be added to resources"
  type        = map
}
