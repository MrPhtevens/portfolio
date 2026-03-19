# Create Application Insights
resource "azurerm_application_insights" "app_insights" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                = each.value.app_insights_name
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location            = azurerm_resource_group.rg[each.key].location
  application_type    = "web"
  tags                = each.value.tags
}
