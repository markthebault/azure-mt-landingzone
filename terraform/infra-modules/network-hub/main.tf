module "resource_group" {
  source = "../../resource-modules/resource-group"
  region = var.region
  name   = var.rg_name

  tags = var.tags
}

module "vnet" {
  source              = "../../resource-modules/network/vnet"
  resource_group      = module.resource_group.resource_group
  vnet_address_ranges = var.vnet_address_ranges
  vnet_name           = var.vnet_name

  tags = var.tags
}

module "vnet_subnets" {
  source         = "../../resource-modules/network/vnet-subnets"
  resource_group = module.resource_group.resource_group
  vnet_name      = module.vnet.vnet_name
  subnets        = var.subnets
}

module "nsg_subnets_public" {
  source         = "../../resource-modules/network/nsg"
  resource_group = module.resource_group.resource_group

  subnet_ids = matchkeys(   
    module.vnet_subnets.subnets.*.id,
    module.vnet_subnets.subnets.*.name,
    ["public"]
  )


  subnet_names = ["public"]
  nsg_rules    = var.nsg_rules_public

  tags      = var.tags
  vnet_name = module.vnet.vnet_name
  nsg_name  = "${var.nsg_name}_public"
}

module "gateway" {
  source                = "../../resource-modules/network/vnet-gateway"
  resource_group        = module.resource_group.resource_group
  certificate_data      = var.certificate_data
  client_address_spaces = var.client_address_spaces
  vpn_client_protocols  = var.vpn_client_protocols

  gateway_subnet = element(
    matchkeys(
      module.vnet_subnets.subnets.*.id,
      module.vnet_subnets.subnets.*.name,
      ["GatewaySubnet"],
    ),
    0,
  )

  region    = var.region
  vnet_name = module.vnet.vnet_name
  gwip_name = var.gwip_name
  gw_name   = var.gw_name

  tags = var.tags
}

//TODO: Add Bastion host activable