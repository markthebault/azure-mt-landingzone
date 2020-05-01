# Resource role assignment

This module creates a role assigment for a given principal ID

## Usage

```javascript
    principal_id = module.sp.object_id
    roles = [
        {
            scope_id    = module.resource_group.resource_group.id,
            role        = "Contributor"
        }
    ]
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
| roles | Roles that will be attached to the principal | `list(map(string))` | n/a | yes |
| principal\_id | Object ID of the AAD resource that the roles will be attached | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| roles\_assignments | List of roles assignment that have been created |

