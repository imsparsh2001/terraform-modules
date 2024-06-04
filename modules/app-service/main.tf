resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"                      # Required argument
  sku_name            = "B1"                         # Required argument

  # other configurations if necessary
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  linux_fx_version    = "DOCKER|nginx:latest"        # Moved out of site_config

  site_config {
    # other configurations if necessary
  }
}
