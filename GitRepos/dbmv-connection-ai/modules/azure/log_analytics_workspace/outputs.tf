output "id" {
  value = length(azurerm_log_analytics_workspace.log) > 0 ? azurerm_log_analytics_workspace.log.id : null
}
