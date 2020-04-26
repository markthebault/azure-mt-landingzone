resource "azurerm_public_ip" "vnet_gateway" {
  name                = var.gwip_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  allocation_method   = var.ip_allocation
}

resource "azurerm_virtual_network_gateway" "main" {
  name                = var.gw_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  type     = var.gateway_type
  vpn_type = var.vpn_type

  sku = var.sku

  ip_configuration {
    name                          = azurerm_public_ip.vnet_gateway.name
    public_ip_address_id          = azurerm_public_ip.vnet_gateway.id
    private_ip_address_allocation = var.ip_allocation
    subnet_id                     = var.gateway_subnet
  }


  vpn_client_configuration {
    address_space        = var.client_address_spaces
    vpn_client_protocols = var.vpn_client_protocols

    root_certificate {
      name = "Self-signed-P2S-KV-cert"

      public_cert_data = var.certificate_data
    }
  }
  tags = var.tags
}
