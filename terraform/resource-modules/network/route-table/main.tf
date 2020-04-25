resource "azurerm_subnet_route_table_association" "private" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.nattable.id
}

resource "azurerm_route_table" "nattable" {
  name                = "${var.prefix}-natroutetable"
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = "natrule1"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.ip_next_hop
  }
}