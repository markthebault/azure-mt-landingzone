# **Resource Modules: Recovery Services Vault**

This TF module creates a Recovery Services Vault within an existing resource group. The vault will be created with the same name as the resource group.



## Example Variables
```javascript
  resource_group  = "RECOVERY_USEAST_P"
  sku             = "Standard"
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
| resource\_group | The resource group where the resource will be created | `any` | n/a | yes |
| rsv\_name | The name of the Recovery Service Vault | `any` | n/a | yes |
| sku | SKU for Recovery Services Vault | `string` | `"Standard"` | no |
| tags | Tags to be added to resource | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| recovery\_services\_id | Recovery Services Vault resource id |

