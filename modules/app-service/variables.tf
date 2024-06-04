variable "app_service_plan" {
  description = "App service plan name"
  type        = string
}

variable "app_service_name" {
  description = "App service name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}
