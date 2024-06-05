variable "name" {
  description = "The base name for the App Service Plan and Web App"
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
  type        = string
}

variable "linux_fx_version" {
  description = "The runtime stack for the Linux web app"
  type        = string
}

variable "app_settings" {
  description = "Application settings for the web app"
  type        = map(string)
  default     = {}
}
