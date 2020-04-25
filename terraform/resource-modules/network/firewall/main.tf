resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group.rg.name
  virtual_network_name = var.virtual_network.vnetwork.name
  address_prefix       = var.subnet_address_range
}

resource "azurerm_public_ip" "firewall_ip" {
  name                = var.firewall_public_ip_name
  location            = var.resource_group.rg.location
  resource_group_name = var.resource_group.rg.name
  allocation_method   = var.ip_allocation_method
  sku                 = var.ip_sku

  tags = var.tags
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  location            = var.resource_group.rg.location
  resource_group_name = var.resource_group.rg.name

  ip_configuration {
    name                 = var.fw_ip_configuration_name
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_ip.id
  }

  tags = var.tags
}

resource "azurerm_firewall_network_rule_collection" "preprod_prod_nrc_fw_rules" {
  name                = var.firewall_rules_nrc_name
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = var.resource_group.rg.name
  priority            = var.firewall_rules_nrc_priority
  action              = var.firewall_rules_nrc_action

  rule {
    name = var.nrc_rule_spoke1to2_name

    source_addresses = [
      var.address_prefix_spoke2,
    ]

    destination_ports = [
      var.nrc_rule_spoke1to2_dest_ports,
    ]

    destination_addresses = [
      var.address_prefix_spoke1,
    ]

    protocols = [
      var.nrc_rule_spoke1to2_protocols,
    ]
  }

  rule {
    name = var.nrc_rule_spoke2to1_name

    source_addresses = [
      var.address_prefix_spoke1,
    ]

    destination_ports = [
      var.nrc_rule_spoke2to1_dest_ports,
    ]

    destination_addresses = [
      var.address_prefix_spoke2,
    ]

    protocols = [
      var.nrc_rule_spoke2to1_protocols,
    ]
  }
}
