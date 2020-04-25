variable "prefix" {
  description = "Prefix that will be added to all names"
}
variable "resource_group_location" {
  description = "Location of the resource group for the nat VM"
}
variable "resource_group_name" {
  description = "Name of the resource group for the nat VM"
}
variable "nat_nsg_id" {
  description = "Network security group where the natvm will be deployed"
}
variable "nat_subnet_id" {
  description = "Subnet where the natvm will be deployed"
}
variable "vmsize" {
  description = "Size of the nat vm, bigger size = bigger throughput"
  default     = "Standard_DS11_v2"
}

variable "tags" {
  description = ""
  default     = {}
}

variable "admin_username" {
  default     = "nat"
  description = "name of the user to ssh the VM"
}