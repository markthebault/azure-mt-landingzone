resource "azurerm_resource_group" "main" {
  name      = var.name
  location  = var.region
  tags      = var.tags
}