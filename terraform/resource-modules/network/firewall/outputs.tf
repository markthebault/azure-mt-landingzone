output "firewall_private_ip" {
  value       = azurerm_firewall.firewall.ip_configuration.0.private_ip_address
  description = "Private IP Address for Firewall"
}
