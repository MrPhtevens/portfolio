output "name" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.name : null
}

output "id" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.id : null
}

output "instrumentation_key" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.instrumentation_key : null
}

output "app_id" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.app_id : null
}

output "workspace_id" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.workspace_id : null
}

output "connection_string" {
  value = length(azurerm_application_insights.appi) > 0 ? azurerm_application_insights.appi.connection_string : null
}
