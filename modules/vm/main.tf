
# Linux VM
resource "azurerm_virtual_machine" "linux_vm" {
  name                  = "LinuxVM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_DS1_v2"
  network_interface_ids = [azurerm_network_interface.linux_nic.id]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "LinuxVM"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "linux_nic" {
  name                = "LinuxNIC"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows VM
resource "azurerm_virtual_machine" "windows_vm" {
  name                  = "WindowsVM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  vm_size               = "Standard_DS1_v2"
  network_interface_ids = [azurerm_network_interface.windows_nic.id]

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "WindowsVM"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_updates = true
  }
}

resource "azurerm_network_interface" "windows_nic" {
  name                = "WindowsNIC"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
