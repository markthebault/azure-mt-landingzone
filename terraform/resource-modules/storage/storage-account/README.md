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

```## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| storage\_location | storage location name | `string` | n/a | yes |
| storage\_account\_name | storage account name | `string` | n/a | yes |
| storage\_resource\_group\_name | resource group name | `string` | n/a | yes |
| storage\_account\_tier | account tier | `string` | `"Standard"` | no |
| storage\_account\_replication\_type | account replication type | `string` | `"LRS"` | no |
| storage\_enable\_https\_traffic\_only | Should storage endpoints be https only | `bool` | `true` | no |
| is\_hns\_enabled | Use Hierarchical namespaces (DataLake instead of Blob) | `bool` | `true` | no |
| network\_rules\_default\_action | Firewall default action for the storage account | `string` | `"Allow"` | no |
| storage\_virtual\_network\_subnet\_ids | The list of vnet ids have access to storage | `list(string)` | n/a | yes |
| shares | File shares which are needed to be created | <pre>list(object({<br>    file_share_name = string<br>    data_share_quota = number<br>  }))</pre> | `[]` | no |
| storage\_network\_cidrs\_allowed | The list of cidrs that have access to storage | `list(string)` | `[]` | no |
| containers | List of containers to create and their access levels. | `list(object({ name = string, access_type = string }))` | `[]` | no |
| log\_analytics\_workspace\_id | (Required) The id of the log analytics workspace, where the data should get pushed to | `any` | n/a | yes |
| log\_categories | (Optional) Log Categories to enable | <pre>list(object({<br>    name = string<br>    enabled = bool<br>    retention_days = number<br>  }))</pre> | `[]` | no |
| metric\_categories | (Optional) Metric Categories to enable | <pre>list(object({<br>    name = string<br>    enabled = bool<br>    retention_days = number<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "Capacity",<br>    "retention_days": 7<br>  },<br>  {<br>    "enabled": true,<br>    "name": "Transaction",<br>    "retention_days": 7<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| primary\_connection\_string | The primary connection string of the storage account |
| primary\_access\_key | The primary access key of the storage account |
| storage\_account\_name | Name |
| primary\_blob\_endpoint | Primary blob endpoint |
| shares | n/a |
| containers | n/a |

