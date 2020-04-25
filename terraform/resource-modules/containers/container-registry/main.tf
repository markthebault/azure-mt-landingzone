resource "azurerm_container_registry" "container_registry" {
  name                = var.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  sku                 = var.sku
}

resource "azurerm_monitor_diagnostic_setting" "acr_diag_settings" {
  name               = "${var.name}-diag"
  target_resource_id = azurerm_container_registry.container_registry.id
  log_analytics_workspace_id = var.log_analytics_workspace_id  

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