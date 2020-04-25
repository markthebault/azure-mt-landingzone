output "azurerm_log_analytics_workspace" { 
    description = "Log Analytics Workspace"
    value = azurerm_log_analytics_workspace.main
}

output "azurerm_log_analytics_solution" { 
    description = "Log Analytics Solutions"
    value = azurerm_log_analytics_solution.main
}