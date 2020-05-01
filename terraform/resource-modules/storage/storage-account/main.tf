resource "azurerm_storage_account" "asa" {
  name                = var.storage_account_name
  resource_group_name = var.storage_resource_group_name

  location                 = var.storage_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.kind
  is_hns_enabled           = var.is_hns_enabled
  enable_https_traffic_only = var.storage_enable_https_traffic_only

  network_rules {
    default_action             = var.network_rules_default_action
    virtual_network_subnet_ids = var.storage_virtual_network_subnet_ids
    ip_rules = var.storage_network_cidrs_allowed
    bypass = ["Logging","Metrics","AzureServices"]
  }
  dynamic "blob_properties"{
    for_each = var.kind == "BlobStorage" ? [1] : []

    content{
      delete_retention_policy {
        days = var.retention_policy_days
      }
    }
  }

  
  
  tags = var.tags
}

resource "azurerm_storage_share" "share" {
  count                = length(var.shares)
  name                 = var.shares[count.index].file_share_name
  storage_account_name = azurerm_storage_account.asa.name
  quota                = var.shares[count.index].data_share_quota
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.containers)
  name                  = var.containers[count.index].name
  storage_account_name  = azurerm_storage_account.asa.name
  container_access_type = var.containers[count.index].access_type
}

resource "azurerm_monitor_diagnostic_setting" "storage_account_diag_settings" {
  name                        = var.storage_account_name 
  target_resource_id          = azurerm_storage_account.asa.id
  log_analytics_workspace_id  = var.log_analytics_workspace_id  

  dynamic "log" {
    for_each = [ 
      for category in var.log_categories: {
        name = category.name
        enabled = category.enabled
        retention_days = category.retention_days
      }
    ]
    content {
      category = log.value.name
      enabled  = log.value.enabled

      retention_policy {
        enabled = log.value.enabled
        days = log.value.retention_days
      }
    }
  }

  dynamic "metric" {
    for_each = [
      for category in var.metric_categories: {
        name = category.name
        enabled = category.enabled
        retention_days = category.retention_days
      }
    ]
    content {
      category = metric.value.name
      enabled   = metric.value.enabled
      retention_policy {
        enabled = metric.value.enabled
        days = metric.value.retention_days
      }
    }
  }
}