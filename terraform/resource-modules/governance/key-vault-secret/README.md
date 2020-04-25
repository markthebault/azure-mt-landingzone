# key-vault-secret

Creates a list of Key Vault Secret.

```javascript
    config = [{
        name         = "storage-account-key"
        value        = module.storage_account.primary_access_key
        key_vault_id = module.customer_keyvault.id
    }]

```## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | (Optional) A mapping of tags to assign to the resource | `map` | `{}` | no |
| content\_type | (Optional) Specifies the content type for the Key Vault Secret. | `string` | `"secret"` | no |
| config | n/a | <pre>list(object({<br>    name         = string<br>    value        = string<br>    key_vault_id = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| kvsecrets | n/a |

