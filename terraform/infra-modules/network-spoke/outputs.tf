output "vnet_spoke" {
  value       = module.vnet_spoke
  description = "Generated spoke vnet"
}

output "spoke_rg" {
  value       = module.resource_group
  description = "Generated spoke resource group"
}

output "vnet_subnets" {
  value       = module.vnet_subnets
  description = "List of spoke subnets resource"
}

output "vnet_hub_to_spoke_peering" {
  value       = module.vnet_peering
  description = "Peering between hub and spoke vnet"
}