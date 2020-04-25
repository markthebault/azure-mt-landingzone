resource "azurerm_network_security_group" "pub_nsg" {
  name                = "${var.prefix}-vnet-pu-int-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "${var.prefix}-vnet-pu-int-nsg-allow-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "${var.prefix}-vnet-pu-int-nsg-allow-all_tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.public_internal_dest_port_allow
    source_address_prefix      = var.public_internal_cidr_allow
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = var.public_internal_subnet_id
  network_security_group_id = azurerm_network_security_group.pub_nsg.id
}


resource "azurerm_network_security_group" "pri_nsg" {
  name                = "${var.prefix}-vnet-pri-int-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "${var.prefix}-vnet-pri-int-nsg-allow-outbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "${var.prefix}-vnet-pri-int-nsg-allow-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.private_internal_dest_port_allow
    source_address_prefix      = var.private_internal_cidr_allow
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "pri_int" {
  subnet_id                 = var.private_internal_subnet_id
  network_security_group_id = azurerm_network_security_group.pri_nsg.id
}
