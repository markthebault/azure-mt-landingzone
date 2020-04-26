output "nsg" {
  value       = azurerm_network_security_group.main
  description = "Network security group"
}

output "nsg_rules" {
  value       = azurerm_network_security_rule.main
  description = "List of network security group rules"
}
