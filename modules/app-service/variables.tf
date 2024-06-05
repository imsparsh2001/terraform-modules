variable "name" {
  description = "The base name for the Service Plan and Web App"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for these resources"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Service Plan"
  type        = string
}

variable "app_settings" {
  description = "Application settings for the web app"
  type        = map(string)
  default     = {}
}
