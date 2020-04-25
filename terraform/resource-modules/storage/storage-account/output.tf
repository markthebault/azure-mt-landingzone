output "primary_connection_string" {
  sensitive   = true
  description = "The primary connection string of the storage account"
  value       = azurerm_storage_account.asa.primary_connection_string
}

output "primary_access_key" {
  sensitive   = true
  description = "The primary access key of the storage account"
  value       = azurerm_storage_account.asa.primary_access_key
}

output "storage_account_name" {
  description = "Name"
  value       = azurerm_storage_account.asa.name
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint"
  value       = azurerm_storage_account.asa.primary_blob_endpoint
}

output "shares" {
  value = ["${azurerm_storage_share.share.*.name}"]
}

output "containers" {
  value = ["${azurerm_storage_container.container.*.name}"]
}