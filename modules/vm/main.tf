resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_configs
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = { for k, v in var.vm_configs : k => v if v.os_type == "linux" }
  name                 = each.key
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  size                 = each.value.vm_size
  admin_username       = each.value.admin_username
  admin_password       = each.value.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each = { for k, v in var.vm_configs : k => v if v.os_type == "windows" }
  name                 = each.key
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  size                 = each.value.vm_size
  admin_username       = each.value.admin_username
  admin_password       = each.value.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = "latest"
  }
}
