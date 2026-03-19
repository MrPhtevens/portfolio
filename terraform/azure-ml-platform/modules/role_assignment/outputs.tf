output "id" {
  description = "The ID of the role."
  value       = length(azurerm_role_assignment.rbac) > 0 ? azurerm_role_assignment.rbac.id : null
}

output "name" {
  description = "The name of the role."
  value       = length(azurerm_role_assignment.rbac) > 0 ? azurerm_role_assignment.rbac.name : null
}
