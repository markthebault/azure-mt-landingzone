output "log_analytics" {
  value       = module.log_analytics.azurerm_log_analytics_workspace
  description = "Log Analytics Workspace"
}


output "log_analytics_solution" {
  value       = module.log_analytics.azurerm_log_analytics_solution
  description = "Log analytics solution"
}

output "rg" {
  value       = module.resource_group.resource_group
  description = "Log analytics resource group"
}
