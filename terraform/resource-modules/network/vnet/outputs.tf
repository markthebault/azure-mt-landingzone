output "vnet_name" {
  value       = "${azurerm_virtual_network.main.name}"
  description = "Generated vnet name"
}

output "vnet_id" {
  value       = "${azurerm_virtual_network.main.id}"
  description = "vnet resource id"
}
