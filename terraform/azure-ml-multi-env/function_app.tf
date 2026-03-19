# Create Service Plan
resource "azurerm_service_plan" "service_plan" {
  for_each = { for rg in var.resource_groups : rg.function_app_name => rg }

  name                = "plan-${each.value.function_app_name}"
  resource_group_name = azurerm_resource_group.rg[each.value.name].name
  location            = each.value.location
  os_type             = "Linux"
  sku_name            = "B1"
  tags                = each.value.tags
}

# Create Function App
resource "azurerm_linux_function_app" "function_app" {
  for_each = { for rg in var.resource_groups : rg.function_app_name => rg }

  name                       = each.value.function_app_name
  resource_group_name        = azurerm_resource_group.rg[each.value.name].name
  location                   = each.value.location
  storage_account_name       = azurerm_storage_account.func_storage[each.value.name].name
  storage_account_access_key = azurerm_storage_account.func_storage[each.value.name].primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan[each.value.function_app_name].id

  site_config {
    always_on = true
    application_stack {
      python_version = "3.11"
    }
  }

  tags = each.value.tags
}
