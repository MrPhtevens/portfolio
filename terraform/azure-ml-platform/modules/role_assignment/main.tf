# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_role_assignment" "rbac" {
  principal_id         = var.principal_id
  role_definition_name = var.role_definition_name
  scope                = var.scope
}

