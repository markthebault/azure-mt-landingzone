# key-vault

## Getting the values

### Tenant Id

Two options exist:

1. get the specific tenant for your defined subscription

```sh
az account show --subscription a... | jq -r '.tenantId'
```

2. get all tenants you can see

```sh
az account list | jq -r '.[].tenantId'
```

## Test this Module

First change directory to `test`.

```sh
cd test
```

add the required variables to the `key_vault_module_test.go` file

then initialize the test.

```sh
go mod init keyvault
```

When that was successful, you can run the test.

```sh
go test -v -timeout 30m
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | n/a     |

## Inputs

| Name           | Description                                                                                                                    | Type     | Default        | Required |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------- | -------------- | :------: |
| name           | (Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created                              | `any`    | n/a            |   yes    |
| resource_group | (Required) The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created  | `any`    | n/a            |   yes    |
| tenant_id      | (Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.              | `any`    | n/a            |   yes    |
| location       | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created | `string` | `"westeurope"` |    no    |
| sku_name       | (Optional) The Name of the SKU used for this Key Vault. Possible values are standard and premium                               | `string` | `"standard"`   |    no    |
| tags           | (Optional) A mapping of tags to assign to the resource                                                                         | `map`    | `{}`           |    no    |

## Outputs

| Name      | Description |
| --------- | ----------- |
| id        | n/a         |
| vault_uri | n/a         |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->