output "service_plan_id" {
  value       = azurerm_service_plan.example.id
  description = "The ID of the App Service Plan"
}

output "web_app_hostname" {
  value       = azurerm_linux_web_app.example.default_site_hostname
  description = "The default hostname of the Linux Web App"
}
