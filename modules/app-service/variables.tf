variable "name" {
  description = "The base name for the resources"
  type        = string
}

variable "location" {
  description = "The location for these resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan"
  default     = "P1v2"
  type        = string
}

variable "app_settings" {
  description = "Application settings for the Web App"
  type        = map(string)
  default     = {}
}
