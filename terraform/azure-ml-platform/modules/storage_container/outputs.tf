output "id" {
  description = "The ID of the storage container."
  value       = length(azurerm_storage_container.sc) > 0 ? azurerm_storage_container.sc.id : null
}

output "name" {
  description = "The name of the storage container."
  value       = length(azurerm_storage_container.sc) > 0 ? azurerm_storage_container.sc.name : null
}
