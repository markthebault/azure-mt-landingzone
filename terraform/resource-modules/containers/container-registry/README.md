# container-registry - Azure Container Registry Module

## General

The module creates dedicated resource group and deploys an [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) with `Standard` SKU

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | A name used for the container registry | `string` | n/a | yes |
| resource\_group | The resource group where the ACR will be created | `any` | n/a | yes |
| sku | The SKU of the container registry | `string` | `"Standard"` | no |
| log\_categories | (Optional) Log Categories to enable | <pre>list(object({<br>    name = string<br>    enabled = bool<br>    retention_days = number<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "ContainerRegistryLoginEvents",<br>    "retention_days": 7<br>  },<br>  {<br>    "enabled": true,<br>    "name": "ContainerRegistryRepositoryEvents",<br>    "retention_days": 7<br>  }<br>]</pre> | no |
| metric\_categories | (Optional) Metric Categories to enable | <pre>list(object({<br>    name = string<br>    enabled = bool<br>    retention_days = number<br>  }))</pre> | <pre>[<br>  {<br>    "enabled": true,<br>    "name": "AllMetrics",<br>    "retention_days": 7<br>  }<br>]</pre> | no |
| log\_analytics\_workspace\_id | The id of the log analytics workspace, where all the diagnostics data should get stored in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| registry | The created container registry |

