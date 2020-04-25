output "route_table" {
  value = azurerm_route_table.nattable
}

output "route_table_association" {
  value = azurerm_subnet_route_table_association.private
}