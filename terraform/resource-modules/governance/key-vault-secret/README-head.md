# key-vault-secret

Creates a list of Key Vault Secret.

```javascript
    config = [{
        name         = "storage-account-key"
        value        = module.storage_account.primary_access_key
        key_vault_id = module.customer_keyvault.id
    }]

```