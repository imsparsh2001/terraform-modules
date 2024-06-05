vm_configs = {
  "vm1" = {
    vm_name        = "vm1",
    vm_size        = "Standard_DS1_v2",
    subnet_id      = "subnet_id_here",  
    os_publisher   = "Canonical",
    os_offer       = "UbuntuServer",
    os_sku         = "18.04-LTS",
    os_disk_size   = 30,
    admin_username = "adminuser",
    admin_password = "ComplexPassword123!"
  },
  "vm2" = {
    vm_name        = "vm2",
    vm_size        = "Standard_DS2_v2",
    subnet_id      = "subnet_id_here",  
    os_publisher   = "Canonical",
    os_offer       = "UbuntuServer",
    os_sku         = "20.04-LTS",
    os_disk_size   = 30,
    admin_username = "anotheruser",
    admin_password = "AnotherComplexPassword123!"
  }
}
