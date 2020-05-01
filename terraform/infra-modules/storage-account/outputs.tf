output "storage_account" {
  value       = module.storage_account
  description = "Storage account resource id"
}

output "rg" {
  value       = module.resource_group.resource_group
  description = "Storage account resource group"
}
