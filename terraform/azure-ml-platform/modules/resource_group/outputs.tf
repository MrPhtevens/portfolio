output "name" {
  value = length(azurerm_resource_group.rg) > 0 ? azurerm_resource_group.rg.name : null
}

output "location" {
  value = length(azurerm_resource_group.rg) > 0 ? azurerm_resource_group.rg.location : null
}
