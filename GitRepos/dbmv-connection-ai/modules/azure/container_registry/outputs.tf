output "id" {
  description = "The ID of the Azure Container Registry."
  value       = length(azurerm_container_registry.cr) > 0 ? azurerm_container_registry.cr.id : null
}

output "name" {
  description = "The name of the Azure Container Registry."
  value       = length(azurerm_container_registry.cr) > 0 ? azurerm_container_registry.cr.name : null
}

output "login_server" {
  description = "The login server of the Azure Container Registry."
  value       = length(azurerm_container_registry.cr) > 0 ? azurerm_container_registry.cr.login_server : null
}

output "admin_username" {
  description = "The admin username for the registry (if admin is enabled)."
  value       = length(azurerm_container_registry.cr) > 0 ? azurerm_container_registry.cr.admin_username : null
  sensitive   = true
}

output "admin_password" {
  description = "The admin password for the registry (if admin is enabled)."
  value       = length(azurerm_container_registry.cr) > 0 ? azurerm_container_registry.cr.admin_password : null
  sensitive   = true
}
