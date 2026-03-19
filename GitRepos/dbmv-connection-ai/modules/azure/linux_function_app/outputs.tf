output "id" {
  description = "The ID of the Function App"
  value       = length(azurerm_linux_function_app.func) > 0 ? azurerm_linux_function_app.func.id : null
}

output "name" {
  description = "Name of the Function App"
  value       = length(azurerm_linux_function_app.func) > 0 ? azurerm_linux_function_app.func.name : null
}

output "url" {
  description = "The default hostname for the Function App"
  value       = length(azurerm_linux_function_app.func) > 0 ? azurerm_linux_function_app.func.default_hostname : null
}

output "principal_id" {
  description = "System-assigned Managed Identity principal ID"
  value       = length(azurerm_linux_function_app.func) > 0 ? azurerm_linux_function_app.func.identity[0].principal_id : null
}
