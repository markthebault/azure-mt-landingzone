###################### Variables

variable "management_groups" {
  description = "(Required) Gets the map of management groups and attached subscriptions"
  type = map
}

variable "tags" {
    description = "the given tags"
}

variable "enabled" {
  description = "(Required) toggle to enable management group deployment"
}


###################### Resources

resource "azurerm_management_group" "parent_management_group" {
  count = var.enabled ? 1 : 0
 
    display_name      = var.management_groups.root.name
}

resource "azurerm_management_group" "children" {
  for_each                      = var.enabled ? var.management_groups.root.children : {}
    parent_management_group_id  = azurerm_management_group.parent_management_group[0].id
    display_name                = each.value.name 
    subscription_ids            = each.value.subscription_ids
}

###################### Outputs

output "mgnt_group" {
  value       = azurerm_management_group.parent_management_group
  description = "The created management group"
}

output "children" {
  value       = azurerm_management_group.children
  description = "Children mgnt groups attached to the parent"
}