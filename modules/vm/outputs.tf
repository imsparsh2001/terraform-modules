output "linux_vm_id" {
  value = azurerm_virtual_machine.linux_vm.id
}

output "windows_vm_id" {
  value = azurerm_virtual_machine.windows_vm.id
}

output "linux_vm_private_ip" {
  value = azurerm_network_interface.linux_nic.private_ip_address
}

output "windows_vm_private_ip" {
  value = azurerm_network_interface.windows_nic.private_ip_address
}
