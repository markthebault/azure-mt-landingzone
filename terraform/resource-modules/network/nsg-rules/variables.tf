variable "prefix" {
  description = "Prefix that will be added to the name of the created resources"
}
variable "location" {
  description = "Location of the deployment"
}
variable "resource_group_name" {
  description = "Name of the resource group where the resources will be created"
}

variable "public_internal_subnet_id" {
  description = "ID of the public internal subnet"
}
variable "private_internal_subnet_id" {
  description = "ID of the private internal subnet"
}


variable "public_internal_cidr_allow" {
  description = "CIDR that will be allows from the the public internal subnet"
}
variable "private_internal_cidr_allow" {
  description = "CIDR that will be allows from the of the private internal subnet"
}

variable "public_internal_dest_port_allow" {
  description = "Ports that will be reachable from the previously passed cidr"
  default     = "*"
}
variable "private_internal_dest_port_allow" {
  description = "Ports that will be reachable from the previously passed cidr"
  default     = "*"
}