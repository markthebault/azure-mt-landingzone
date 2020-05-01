output "current_subscription_display_name" {
  value = data.azurerm_subscription.primary_subscription.display_name
}
output "managed_identity_name" {
  description = "The name what you need for your Azure Identity Binding <a-idname>"
  value       = azurerm_user_assigned_identity.uai.name
}

output "assigned_client_id" {
  description = "Client ID associated with the user assigned identity. Referenced in AKS kind: AzureIdentity 'ClientID:' <clientId>"
  value       = azurerm_user_assigned_identity.uai.client_id
}

output "assigned_principal_id" {
  description = "Service Principal ID associated with the user assigned identity."
  value       = azurerm_user_assigned_identity.uai.principal_id
}

output "user_assigned_identity_id" {
  description = "The user assigned identity ID. Referenced in AKS kind: AzureIdentity 'ResourceID: /subscriptions/...'"
  value       = azurerm_user_assigned_identity.uai.id
}
