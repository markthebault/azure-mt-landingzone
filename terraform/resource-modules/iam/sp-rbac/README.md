# Service principal for RBAC

This module creates a service principal to use some azure resources

## Usage

```javascript
    name = "company-department-service-azureresource-contributor-sp"
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| random | n/a |
| azuread | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the application service principal that will be created | `string` | n/a | yes |
| app\_role\_assignment\_required | If users need to be assined to the SP to be able to use it | `bool` | `false` | no |
| available\_in\_other\_tenants | If the services principal can be available in a different tenant | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| app | Application created for the service principal |

