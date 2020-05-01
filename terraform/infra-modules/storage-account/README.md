#  Storage Account

This module deploys an Azure Storage Account and Resource Group.

## Resources Created

| Type     | resource module     |
|----------|------------|
| Resource Group | [resource-group](../../resource-modules/resource-group/README.md)|
| Storage Account | [storage/storage-account](../../resource-modules/storage/storage-account/README.md)|

## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| rg\_name | Name of the Resource Group | `any` | n/a | yes |
| region | Geographic region resource will be deployed into | `any` | n/a | yes |
| stor\_name | Name of the storage account to create. | `any` | n/a | yes |
| stor\_kind | Type of storage to use, valid inputs include Storage, StorageV2, BlobStorage | `string` | `"StorageV2"` | no |
| stor\_tier | Tier of storage to use, valid inputs include Standard, Premium | `string` | `"Standard"` | no |
| retention\_policy\_days | Time in days that the resource will be still available after deletion | `number` | `7` | no |
| log\_analytics\_workspace\_id | Log analytic workspace ID | `any` | n/a | yes |
| stor\_replication | Replication type to use, valid inputs include LRS, GRS, RAGRS, ZRS | `string` | `"LRS"` | no |
| access\_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| file\_shares | File shares that will be created with the account | `list` | `[]` | no |
| containers | Containers that will be created with the account | `list` | `[]` | no |
| tags | Tags to be added to resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account | Storage account resource id |
| rg | Storage account resource group |

