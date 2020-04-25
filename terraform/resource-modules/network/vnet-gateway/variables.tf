variable "resource_group" {
  description = "Resource Group that vNet Gateway will deploy into, must be same as the vNet's resource gorup"
}

variable "vnet_name" {
  description = "Name of the Vnet"

}

variable "region" {
  description = "Geographic region resource will be deployed into"

}

variable "gwip_name" {
  description = "Name of the Gateway Public IP"

}

variable "gw_name" {
  description = "Name of the Gateway"

}

variable "gateway_subnet" {
  description = "The GateWay subnet id that the VPN gateway will use"
  default     = ""
}

variable "ip_allocation" {
  description = "Allocation method for Public IP Address; Can beStatic or Dynamic"
  default     = "Dynamic"
}

variable "gateway_type" {
  description = "Virtual Network Gateway Type; Can be VPN or ExpressRoute"
  default     = "VPN"
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway; Can be RouteBased or PolicyBased."
  default     = "RouteBased"
}

variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway; Can be are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw1AZ, VpnGw2AZ, and VpnGw3AZ and depend on the type and vpn_type arguments. A PolicyBased gateway only supports the Basic sku. Further, the UltraPerformance sku is only supported by an ExpressRoute gateway."
  default     = "VpnGw1"
}

variable "client_address_spaces" {
  description = "The address space out of which ip addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation"
  type        = list
}

variable "vpn_client_protocols" {
  description = "List of the protocols supported by the vpn client. The supported values are SSTP, IkeV2 and OpenVPN."
  type        = list
}

variable "certificate_data" {
  description = "Certificate Information generated from Key Vault that the vNet gateway will use for the P2S connections"
  default     = ""
}

variable "tags" {
  description = "Tags to be added to resource"
  type        = map
}
