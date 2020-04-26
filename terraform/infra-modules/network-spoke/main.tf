module "resource_group" {
  source = "../../resource-modules/resource-group"
  region = var.region
  name   = var.rg_name

  tags = var.tags
}

module "vnet_spoke" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group
  vnet_address_ranges = var.vnet_address_ranges
  vnet_name           = var.vnet_name

  tags = var.tags
}

module "vnet_subnets" {
  source         = "../../resource-modules/network/vnet-subnets"
  resource_group = module.resource_group.resource_group
  vnet_name      = module.vnet_spoke.vnet_name
  subnets        = var.subnets_spoke
}

module "nsg_subnets_public" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group

  subnet_ids = matchkeys(
    module.vnet_subnets.subnets.*.id,
    module.vnet_subnets.subnets.*.name,
    list("public"))

  subnet_names = ["public"]
  nsg_rules    = var.nsg_rules_public

  tags      = var.tags
  vnet_name = module.vnet_spoke.vnet_name
  nsg_name  = "${var.nsg_name}-public"
}

module "nsg_subnets_private" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group

  subnet_ids = matchkeys(
    module.vnet_subnets.subnets.*.id,
    module.vnet_subnets.subnets.*.name,
    list("private"))

  subnet_names = ["private"]
  nsg_rules    = var.nsg_rules_private

  tags      = var.tags
  vnet_name = module.vnet_spoke.vnet_name
  nsg_name  = "${var.nsg_name}-private"
}

module "nsg_subnets_data" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group

  subnet_ids = matchkeys(
    module.vnet_subnets.subnets.*.id,
    module.vnet_subnets.subnets.*.name,
    list("data"))

  subnet_names = ["data"]
  nsg_rules    = var.nsg_rules_data

  tags      = var.tags
  vnet_name = module.vnet_spoke.vnet_name
  nsg_name  = "${var.nsg_name}-data"
}


#Data for Hub Vnet id (one less parameter to pass to vars)
data "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  resource_group_name = var.hub_vnet_rg
}

module "vnet_peering" {
  source                      = "../../resource-modules/network/vnet-peering"
  hub_vnet_name               = var.hub_vnet_name
  hub_vnet_rg_name            = var.hub_vnet_rg
  hub_vnet_id                 = data.azurerm_virtual_network.hub.id
  spoke_vnet_name             = module.vnet_spoke.vnet_name
  spoke_vnet_id               = module.vnet_spoke.vnet_id
  spoke_vnet_rg_name          = module.resource_group.resource_group.name
  allow_forwarded_traffic     = var.allow_forwarded_traffic
  hub_allow_gateway_transit   = var.hub_allow_gateway_transit
  hub_use_remote_gateways     = var.hub_use_remote_gateways
  spoke_allow_gateway_transit = var.spoke_allow_gateway_transit
  spoke_use_remote_gateways   = var.spoke_use_remote_gateways
  hub_to_spoke_name           = var.hub_to_spoke_name
  spoke_to_hub_name           = var.spoke_to_hub_name

  providers = {
    azurerm.spoke = azurerm,
    azurerm.hub = azurerm.shared_services
  }
}
