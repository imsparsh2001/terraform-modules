output "web_app_hostname" {
  value       = azurerm_linux_web_app.example.default_hostname
  description = "The default hostname of the Linux Web App"
}
