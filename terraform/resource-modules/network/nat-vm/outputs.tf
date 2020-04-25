output "nat_vm_password" {
  value = random_string.password.result
}

output "nat_vm_nic" {
  value = azurerm_network_interface.natnic
}

output "nat_vm" {
  value = azurerm_virtual_machine.natvm
}

