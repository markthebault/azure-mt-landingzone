variable "roles" {
  type = list(map(string))
  description = "Roles that will be attached to the principal"
}

variable "principal_id" {
  type        = string
  description = "Object ID of the AAD resource that the roles will be attached"
}

##################### Resources
resource "azurerm_role_assignment" "roles" {
  count                = length(var.roles)
  principal_id         = var.principal_id
  scope                = var.roles[count.index].scope_id
  role_definition_name = var.roles[count.index].role_definition
}

##################### Outputs
output "roles_assignments" {
  value       = azurerm_role_assignment.roles
  description = "List of roles assignment that have been created"
}