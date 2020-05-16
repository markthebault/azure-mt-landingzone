# Log Analytics

This module creates a Resource Group containing a Log Analytics Workspace.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Log Analytics Workspace | [governance/log-analytics](../../resource-modules/governance/log-analytics/README.md)|

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg\_name | Name of the Resource Group | `any` | n/a | yes |
| log\_analytics\_name | Name of the Log Anayltics Workspace | `any` | n/a | yes |
| region | Geographic region resource will be deployed into | `any` | n/a | yes |
| retention\_period | Time in days to retain logs in the log analytics workspace | `number` | `30` | no |
| activity\_logs\_sa\_name | Name of the activity logs storage account | `string` | n/a | yes |
| activity\_logs\_eventhub\_name | Name of the activity logs event hub | `string` | n/a | yes |
| tags | Tags to be added to resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_analytics | Log Analytics Workspace |
| log\_analytics\_solution | Log analytics solution |
| rg | Log analytics resource group |

