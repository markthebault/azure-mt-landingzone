# Storage Account  Module

Create a storage account StorageV2 by default and Hierarchical namespaces enabled (DLK gen2)

```javascript
  storage_account_name               = "mystorage"
  storage_resource_group_name        = module.main_rg
  storage_virtual_network_subnet_ids = [module.public_sub.id]

  shares = [{
    file_share_name  = "server-app-conf"
    data_share_quota = 5
  }]

  
  containers = [{
    name        = "raw"
    access_type = "private"
  }]

  log_analytics_workspace_id = module.logs_wk.azurerm_log_analytics_workspace.id

```