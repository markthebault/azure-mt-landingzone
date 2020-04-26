output "vnet" {
  value       = module.vnet
  description = "Hub Vnet"
}

output "rg" {
  value       = module.resource_group
  description = "Hub resource group name"
}

output "ubnets" {
  value       = module.vnet_subnets
  description = "List of hub subnets"
}

output "gateway" {
  value       = module.gateway.vnet_gateway
  description = "Virtual network gateway resource"
}

output "subnets_public_nsg" {
  value       = module.nsg_subnets_public.nsg
  description = "Public network security group"
}

