variable "prefix" {
  description = "Prefix that will be added to the name of the created resources"
}
variable "location" {
  description = "Location of the deployment"
}
variable "resource_group_name" {
  description = "Name of the resource group where the resources will be created"
}
variable "subnet_id" {
  description = "ID of the subnet that where will the route table be attached"
}
variable "ip_next_hop" {
  description = "Ip of the hop for the default route"
}
