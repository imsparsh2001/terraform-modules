variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "vm_configs" {
  description = "Map of VM configurations"
  type = map(object({
    os_type         = string
    vm_size         = string
    admin_username  = string
    admin_password  = string
    image_publisher = string
    image_offer     = string
    image_sku       = string
  }))
}
