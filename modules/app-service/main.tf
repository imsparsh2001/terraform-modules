resource "azurerm_service_plan" "app_service_plan" { # Updated resource name
  name                = var.app_service_plan
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id # Updated to reference azurerm_service_plan

  linux_fx_version    = "DOCKER|nginx:latest" # Moved out of site_config

  site_config {
   
  }
}

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
