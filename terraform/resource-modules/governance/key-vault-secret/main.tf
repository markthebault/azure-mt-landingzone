resource "azurerm_key_vault_secret" "kvsecret" {
  count = length(var.config)

  name         = var.config[count.index].name
  value        = var.config[count.index].value
  content_type = var.content_type
  key_vault_id = var.config[count.index].key_vault_id

  tags = var.tags
}
