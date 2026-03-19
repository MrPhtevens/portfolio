output "id" {
  description = "ID of the Key Vault Policy."
  value       = length(azurerm_key_vault_access_policy.kvpol) > 0 ? azurerm_key_vault_access_policy.kvpol.id : null
}

output "key_vault_id" {
  description = "ID of the Key Vault."
  value       = length(azurerm_key_vault_access_policy.kvpol) > 0 ? azurerm_key_vault_access_policy.kvpol.key_vault_id : null
}

