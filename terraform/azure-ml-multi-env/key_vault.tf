# Create Key Vaults for each environment with generic names
resource "azurerm_key_vault" "key_vault" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                = each.value.keyvault_name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = each.value.tags
}
