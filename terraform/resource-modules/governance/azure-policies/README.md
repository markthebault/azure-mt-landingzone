# Azure Policies

Bunch of custom azure policies

## Description of the polcies
### Allowed locations
todo
### Allowed reources type
### Allow create public ips
### Enable azure monitor
### Enable network watcher


## Example

```javascript
  policies_matrix         = var.governance_settings.policy_matrix
  log_analytics           = var.log_analytics.name
  scope                   = data.azurerm_subscription.current.id
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
| policies\_matrix | Matrix of settings that will be applied to the configuration container - typically management group | `any` | n/a | yes |
| scope | The scope  where the policies will be assigned | `any` | n/a | yes |
| log\_analytics | Log analytics repository | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policies\_netwatcher\_principal\_id | Get the export of the managed identity created |
| policies\_vm\_automon\_principal\_id | Get the export of the managed identity created |

