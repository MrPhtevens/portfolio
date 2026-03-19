# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_key_vault_access_policy" "kvpol" {
  key_vault_id = var.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = var.object_id

  certificate_permissions = var.certificate_permissions
  key_permissions = var.key_permissions
  secret_permissions = var.secret_permissions
  storage_permissions = var.storage_permissions
}
