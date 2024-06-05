output "vm_ids" {
  value = {for key, vm in azurerm_virtual_machine.vm : key => vm.id}
}

output "vm_names" {
  value = { for key, vm in azurerm_virtual_machine.vm : key => vm.name }
  description = "The names of the virtual machines."
}

output "nic_ids" {
  value = {for key, nic in azurerm_network_interface.vm_nic : key => nic.id}
}

output "public_ip_addresses" {
  value = { for key, nic in azurerm_network_interface.vm_nic : key => nic.ip_configuration.0.public_ip_address_id }
  description = "Public IP addresses of the VMs, if applicable."
}
