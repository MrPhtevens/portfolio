# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_id    = var.storage_account_id
  container_access_type = var.container_access_type
}
