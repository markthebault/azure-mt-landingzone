# Security Center
Configures the Azure secutrity center for the given scope

```javascript
    contact_email           = "broadcast@list.com"
    contact_phone           = "+33655486521"
    scope_id                = "/subscriptions/00000000-0000-0000-0000-000000000000"
    workspace_id            = module.logq.log.id //Log analytics workspace id
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
| scope\_id | (Required) The scope at which the ASC will be tied, typically a subscription: /subscriptions/00000000-0000-0000-0000-000000000000 | `any` | n/a | yes |
| workspace\_id | (Required) Azure Log Analytics workspace ID that will be used. | `any` | n/a | yes |
| enable\_security\_center | (Optional) Switch to determine if ASC is deployed. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Output the object ID |
| object | Output the full object |

