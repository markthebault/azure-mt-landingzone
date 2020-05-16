###################### Variables
variable "scope_id" {
  description = "(Required) The scope at which the ASC will be tied, typically a subscription: /subscriptions/00000000-0000-0000-0000-000000000000"
}

variable "workspace_id" {
  description = "(Required) Azure Log Analytics workspace ID that will be used."
}

variable "enable_security_center" {
  description = "(Optional) Switch to determine if ASC is deployed."
  default = true
}

###################### Resources
resource "azurerm_security_center_subscription_pricing" "sc" {
  count = var.enable_security_center ? 1 : 0 
  tier = "Standard"
}

resource "azurerm_security_center_workspace" "sc" {
  count = var.enable_security_center ? 1 : 0
  scope        = var.scope_id
  workspace_id = var.workspace_id

  depends_on = [azurerm_security_center_subscription_pricing.sc]
}

###################### Outputs
output "id" {
  description = "Output the object ID"
  value = azurerm_security_center_workspace.sc[*].id
}

output "object" {
  description = "Output the full object"
  value = azurerm_security_center_workspace.sc
}