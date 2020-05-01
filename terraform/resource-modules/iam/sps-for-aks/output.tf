##################### Outputs

output "server_sp" {
  value       =  var.enabled ? azuread_service_principal.server.0 : null
  description = "Server SP created for AKS"
}

output "server_app_secret" {
  value       = var.enabled ? azuread_application_password.server.0.value : null
  description = "Server Secret SP created for AKS"
}
output "client_sp" {
  value       = var.enabled ? azuread_service_principal.client.0 : null
  description = "client SP created for AKS"
}
