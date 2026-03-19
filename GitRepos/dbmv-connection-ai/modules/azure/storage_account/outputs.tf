output "id" {
  description = "The ID of the storage account."
  value       = length(azurerm_storage_account.st) > 0 ? azurerm_storage_account.st.id : null
}

output "name" {
  description = "The name of the storage account."
  value       = length(azurerm_storage_account.st) > 0 ? azurerm_storage_account.st.name : null
}

output "primary_connection_string" {
  description = "The primary connection string of the storage account."
  value       = length(azurerm_storage_account.st) > 0 ? azurerm_storage_account.st.primary_connection_string : null
}

output "primary_access_key" {
  description = "The primary access key storage account."
  value       = length(azurerm_storage_account.st) > 0 ? azurerm_storage_account.st.primary_access_key : null
}

output "primary_blob_endpoint" {
  description = "The primary blob endpoint for the storage account."
  value       = length(azurerm_storage_account.st) > 0 ? azurerm_storage_account.st.primary_blob_endpoint : null
}
