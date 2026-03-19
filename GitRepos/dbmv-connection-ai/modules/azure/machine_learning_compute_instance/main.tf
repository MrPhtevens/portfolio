# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_machine_learning_compute_instance" "mlci" {
  name                          = var.machine_learning_compute_instance_name
  machine_learning_workspace_id = var.workspace_id
  virtual_machine_size          = var.vm_size

  identity {
    type         = var.identity_type
    identity_ids = contains(split(",", var.identity_type), "UserAssigned") ? var.user_assigned_identity_ids : null
  }

  tags                          = var.tags
}

# Lookup users by email
data "azuread_user" "assigned_users" {
  for_each            = toset(var.assigned_user_emails)
  user_principal_name = each.key
}

resource "azurerm_role_assignment" "rbac" {
  for_each             = data.azuread_user.assigned_users

  scope                = azurerm_machine_learning_compute_instance.mlci.id
  role_definition_name = var.role_definition_name
  principal_id         = each.value.id
}

