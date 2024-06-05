resource "azurerm_service_plan" "example" {
  name                = "${var.name}-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "example" {
  name                = "${var.name}-web-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
   
  }

  app_settings = var.app_settings
}
