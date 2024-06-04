resource "azurerm_service_plan" "app_service_plan" {
  name                   = var.app_service_plan_name  # Use a descriptive name
  location               = var.location
  resource_group_name    = var.resource_group_name

  # Required arguments
  kind                   = "Linux"
  sku {
    tier  = "Basic"
    size  = "B1"
  }

  # Other configurations if necessary
}

resource "azurerm_app_service" "app_service" {
  name                   = var.app_service_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  app_service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "DOCKER|nginx:latest"  # Correct placement
    # Other configurations if necessary
  }
}
