# Log Analytic workspace
Create a log analytic workspaces



## Example

```javascript
  name = "log"
  resource_group = module.main_rg

  tags = {
    test = true
  }
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| random | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource\_group | The resource group | `any` | n/a | yes |
| name | A prefix used for all resources in this module | `string` | n/a | yes |
| sku | SKU for the log analtyics workspace | `string` | `"PerGB2018"` | no |
| retention\_period | Retention period for logs and metrics | `number` | `7` | no |
| tags | A map of tags to set on every taggable resources. Default tag for resource identification are applied by default. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| azurerm\_log\_analytics\_workspace | Log Analytics Workspace |
| azurerm\_log\_analytics\_solution | Log Analytics Solutions |

