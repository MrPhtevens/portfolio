output "key_vault_id" {
  description = "ID of the Key Vault."
  value       = length(azurerm_key_vault.kv) > 0 ? azurerm_key_vault.kv.id : null
}

output "key_vault_name" {
  description = "Name of the Key Vault."
  value       = length(azurerm_key_vault.kv) > 0 ? azurerm_key_vault.kv.name : null
}

