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
| policies\_matrix | Matrix of settings that will be applied to the configuration container - typically management group | `map` | <pre>{<br>  "autoenroll_monitor_vm": true,<br>  "autoenroll_netwatcher": false,<br>  "cant_create_ip_spoke": false,<br>  "list_of_allowed_locs": [<br>    "westeurope"<br>  ],<br>  "list_of_supported_svc": [<br>    "Microsoft.Network/publicIPAddresses",<br>    "Microsoft.Compute/disks"<br>  ],<br>  "managed_disks_only": true,<br>  "msi_location": "westeurope",<br>  "no_public_ip_spoke": false,<br>  "restrict_locations": false,<br>  "restrict_supported_svc": false<br>}</pre> | no |
| scope | The scope  where the policies will be assigned | `any` | n/a | yes |
| log\_analytics | Log analytics repository | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policies\_netwatcher\_principal\_id | Get the export of the managed identity created |
| policies\_vm\_automon\_principal\_id | Get the export of the managed identity created |

