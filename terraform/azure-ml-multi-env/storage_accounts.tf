# Create Storage Accounts
resource "azurerm_storage_account" "storage" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                     = each.value.storage_acct_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = each.value.tags
}

# Function Storage Account
resource "azurerm_storage_account" "func_storage" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                     = each.value.function_storage_acct_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = each.value.tags
}
