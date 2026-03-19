# Create Container Registry (Only for Dev)
resource "azurerm_container_registry" "acr" {
  for_each = { for rg in var.resource_groups : rg.name => rg if rg.name == "EXAMPLE-AUE-RG-CONNECTIONAI-DEV01" }

  name                = each.value.container_reg_name
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location            = azurerm_resource_group.rg[each.key].location
  sku                 = "Basic"
  admin_enabled       = true
  tags                = each.value.tags
}
