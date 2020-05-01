module "resource_group" {
  source = "../../resource-modules/resource-group"
  region = var.region
  name   = var.rg_name

  tags = var.tags
}

module "storage_account" {
  source         = "../../resource-modules/storage/storage-account"

  storage_location                   = var.region
  storage_account_name               = var.stor_name
  storage_account_replication_type   = var.stor_replication
  storage_account_tier = var.stor_tier
  kind = var.stor_kind
  storage_resource_group_name        = module.resource_group.resource_group.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  retention_policy_days = var.retention_policy_days

  shares = var.file_shares
  containers = var.containers


  tags = var.tags
}