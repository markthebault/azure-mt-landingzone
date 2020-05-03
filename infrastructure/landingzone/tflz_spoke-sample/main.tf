resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_resource_group" "example" {
  name     = "${random_string.random.result}example"
  location = "West Europe"
}
