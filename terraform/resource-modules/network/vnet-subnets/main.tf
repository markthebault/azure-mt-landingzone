resource "azurerm_subnet" "main" {
  count = length(var.subnets)

  name                 = lookup(var.subnets[count.index],"name")
  address_prefix       = lookup(var.subnets[count.index], "subnet_cidr")
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet_name
  service_endpoints    = split(",", lookup(var.subnets[count.index], "service_endpoints", ""))
}
