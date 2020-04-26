

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "main" {
  count                       = length(var.nsg_rules)
  name                        = lookup(var.nsg_rules[count.index], "name")
  priority                    = lookup(var.nsg_rules[count.index], "priority")
  direction                   = lookup(var.nsg_rules[count.index], "direction")
  access                      = lookup(var.nsg_rules[count.index], "access")
  protocol                    = lookup(var.nsg_rules[count.index], "protocol")
  source_port_range           = lookup(var.nsg_rules[count.index], "source_port_range")
  destination_port_range      = lookup(var.nsg_rules[count.index], "destination_port_range")
  source_address_prefix       = lookup(var.nsg_rules[count.index], "source_address_prefix")
  destination_address_prefix  = lookup(var.nsg_rules[count.index], "destination_address_prefix")
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.main.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnets" {
  count                     = length(var.subnet_names)
  subnet_id                 = element(var.subnet_ids, count.index)
  network_security_group_id = azurerm_network_security_group.main.id
}
