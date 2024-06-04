resource "azurerm_app_service_plan" "app_service_plan" {
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

resource "azurerm_linux_web_app" "app_service" {  # Updated resource
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOCKER|nginx:latest"
  }
}
