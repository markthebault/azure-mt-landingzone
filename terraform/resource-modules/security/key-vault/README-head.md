# key-vault Module

This module will create a keyvault and attach the current account to be able to read and create secrets


```javascript

module "customer_keyvault" {
  source = "./key-vault"

  name                       = local.kv_name
  resource_group             = azurerm_resource_group.customer_rg.name
  log_categories             = var.kv_log_categories
  metric_categories          = var.kv_metric_categories
  log_analytics_workspace_id = module.log-analytics-workspace.azurerm_log_analytics_workspace.id
}

```

