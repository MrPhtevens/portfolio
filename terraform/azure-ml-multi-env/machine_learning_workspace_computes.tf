# Machine Learning Compute Instance
resource "azurerm_machine_learning_compute_instance" "compute" {
  for_each = { for ci in var.compute_instances_dev : ci.name => ci }

  name                          = each.value.name
  machine_learning_workspace_id = azurerm_machine_learning_workspace.ml_workspace["EXAMPLE-AUE-RG-CONNECTIONAI-DEV01"].id
  virtual_machine_size          = each.value.size

  # Assign the user as the owner at creation time
  authorization_type = "personal"
  assign_to_user {
    object_id = each.value.assign_to_user
    tenant_id = var.tenant_id
  }

  tags = each.value.tags
}
