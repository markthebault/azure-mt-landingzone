# aks - Azure K8s Module

The module deploys AKS into the provided VNET, the cluster will be deployed with RBAC and AAD integration

## Example

```javascript
  resource_group_name   = "activity-rg"
  sa_name               = "activitysa"
  location              = "westeurpe"
  logs_retention        = var.retention

  tags = var.tags
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group\_name | (Required) Name of the resource group to deploy the activity logs. | `any` | n/a | yes |
| location | (Required) Define the region where the resources will be created. | `any` | n/a | yes |
| sa\_name | Name of the storage account used to store the event logs | `string` | n/a | yes |
| logs\_rentention | (Required) Number of days to keep the logs for long term retention | `any` | n/a | yes |
| enable\_event\_hub | (Optional) Determine to deploy Event Hub for the configuration | `bool` | `true` | no |
| evthub\_name | The name of the created event hub | `string` | `""` | no |
| tags | (Required) Tags for the logs repositories to be created | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| seclogs\_map | Ouputs a map with storage account id (activity\_sa), eventhub name (activity\_eh\_name) and id (activity\_eh\_id) - if enabled |

