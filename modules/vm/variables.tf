variable "location" {
  description = "The Azure location where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
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
}
