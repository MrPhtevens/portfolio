output "id" {
  description = "ID of the Machine Learning Workspace."
  value       = length(azurerm_machine_learning_workspace.mlw) > 0 ? azurerm_machine_learning_workspace.mlw.id : null
}

output "name" {
  description = "Name of the Machine Learning Workspace."
  value       = length(azurerm_machine_learning_workspace.mlw) > 0 ? azurerm_machine_learning_workspace.mlw.name : null
}

output "location" {
  description = "Location of the Machine Learning Workspace."
  value       = length(azurerm_machine_learning_workspace.mlw) > 0 ? azurerm_machine_learning_workspace.mlw.location : null
}

output "identity_principal_id" {
  description = "Principal ID of the system-assigned identity."
  value       = length(azurerm_machine_learning_workspace.mlw) > 0 ? azurerm_machine_learning_workspace.mlw.identity[0].principal_id : null
}
