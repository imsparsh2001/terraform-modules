resource "azurerm_service_plan" "example" {
  name                = "${var.name}-service-plan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "example" {
  name                = "${var.name}-web-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    always_on = true
  }

  app_settings = var.app_settings
}
