resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.vnet_address_ranges
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_servers         = length(var.dns_servers) != 0 ? var.dns_servers : null

  dynamic "ddos_protection_plan" {
    for_each = lookup(var.ddos_protection_plan, "enable", null) == true ? [1] : []
    content {
      id        = lookup(var.ddos_protection_plan, "id", null)
      enable    = lookup(var.ddos_protection_plan, "enable", false)
    }
  }

  tags = var.tags
}
