########################################
## Setting up Network Resource Variables
########################################
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Hub Vnet"
  type        = string
}

variable "gwip_name" {
  description = "Name of the Gateway Public IP"
  type        = string
}

variable "gw_name" {
  description = "Name of the Gateway"
  type        = string
}

variable "nsg_name" {
  description = "Name of the NSG"
  type        = string
}

variable "vnet_address_ranges" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets with name, subnet_cidr, and service_endpoints."
}

variable "nsg_rules_public" {
  description = "List of NSG rules"
}

variable "certificate_data" {
  description = "Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections"
  type        = string
  default     = ""
}

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list(string)
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list(string)
}

variable "region" {
  description = "Geographic Region resource will be deployed into"
  type        = string
}

variable "tags" {
  description = "Tags to be added to resources"
  type        = map(string)
}

