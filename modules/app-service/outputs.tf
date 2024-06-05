output "service_plan_id" {
  value = azurerm_service_plan.example.id
}

output "web_app_id" {
  value = azurerm_linux_web_app.example.id
}

output "web_app_default_hostname" {
  value = azurerm_linux_web_app.example.default_hostname
}
