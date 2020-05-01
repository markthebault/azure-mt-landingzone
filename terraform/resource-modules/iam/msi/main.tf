resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = var.resource_group
  location            = var.location

  name = var.name
}

data "azurerm_subscription" "primary_subscription" {}

resource "azurerm_role_assignment" "msi" {
  count                = length(var.roles)
  principal_id         = azurerm_user_assigned_identity.uai.principal_id
  scope                = var.roles[count.index].scope_id
  role_definition_name = var.roles[count.index].role_definition
}

# only needed if the user assigned identity is not created inside of the AKS Resources Resource Group (it starts with MC_)
#resource "azurerm_role_assignment" "ra" {
#  for_each = toset(var.role_definition_name)
#  scope                = azurerm_user_assigned_identity.uai.id
#  role_definition_name = each.value
#  principal_id         = var.service_principal_id
#}
