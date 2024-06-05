variable "vm_configs" {
  description = "Configuration for each VM"
  type = map(object({
    vm_name        = string
    vm_size        = string
    subnet_id      = string
    os_publisher   = string
    os_offer       = string
    os_sku         = string
    os_disk_size   = number
    admin_username = string
    admin_password = string
  }))
  default = {
    "vm1" = {
      vm_name        = "vm1",
      vm_size        = "Standard_DS1_v2",
      subnet_id      = "subnet_id_here",  # Replace with actual subnet ID
      os_publisher   = "Canonical",
      os_offer       = "UbuntuServer",
      os_sku         = "18.04-LTS",
      os_disk_size   = 30,
      admin_username = "azureuser",
      admin_password = "ComplexPassword1234!"
    },
    "vm2" = {
      vm_name        = "vm2",
      vm_size        = "Standard_DS2_v2",
      subnet_id      = "subnet_id_here",  # Replace with actual subnet ID
      os_publisher   = "Canonical",
      os_offer       = "UbuntuServer",
      os_sku         = "20.04-LTS",
      os_disk_size   = 30,
      admin_username = "azureuser",
      admin_password = "AnotherComplexPassword1234!"
    }
  }
}
