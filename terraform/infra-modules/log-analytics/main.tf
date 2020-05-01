module "resource_group" {
  source = "../../resource-modules/resource-group"
  name   = var.rg_name
  region = var.region

  tags = var.tags
}

module "log_analytics" {
  source           = "../../resource-modules/governance/log-analytics-workspace"
  resource_group   = module.resource_group.resource_group
  retention_period = var.retention_period
  name          = var.la_name

  tags = var.tags
}
