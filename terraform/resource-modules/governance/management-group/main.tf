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
data "azurerm_management_group" "root" {
  name = var.management_groups.root.name
}

resource "azurerm_management_group" "children" {
  for_each                      = var.enabled ? var.management_groups.root.children : {}
    parent_management_group_id  = data.azurerm_management_group.root.id
    display_name                = each.value.name 
    subscription_ids            = each.value.subscription_ids
}

###################### Outputs

output "children" {
  value       = azurerm_management_group.children
  description = "Children mgnt groups attached to the parent"
}