resource "azurerm_recovery_services_vault" "main" {
  name                = var.rsv_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  sku                 = var.sku

  tags = var.tags
}
