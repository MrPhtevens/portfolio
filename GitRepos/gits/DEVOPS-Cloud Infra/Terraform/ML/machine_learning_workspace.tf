# Create Machine Learning Workspace
resource "azurerm_machine_learning_workspace" "ml_workspace" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                    = each.value.machine_learning_name
  location                = azurerm_resource_group.rg[each.key].location
  resource_group_name     = azurerm_resource_group.rg[each.key].name
  application_insights_id = azurerm_application_insights.app_insights[each.key].id
  storage_account_id      = azurerm_storage_account.storage[each.key].id
  key_vault_id            = azurerm_key_vault.key_vault[each.key].id

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}

# Machine Learning Compute Clusters for each environment
resource "azurerm_machine_learning_compute_cluster" "compute_cluster" {
  for_each = { for rg in var.resource_groups : rg.name => rg }

  name                          = each.value.cluster_name
  machine_learning_workspace_id = azurerm_machine_learning_workspace.ml_workspace[each.key].id
  location                      = azurerm_resource_group.rg[each.key].location
  vm_size                       = lookup(each.value, "cluster_size", "Standard_DS11_v2")
  vm_priority                   = "Dedicated"

  scale_settings {
    min_node_count                       = 0
    max_node_count                       = 29
    scale_down_nodes_after_idle_duration = "PT2M" # 120 seconds
  }

  tags = {
    Environment = each.key
    Source      = "Terraform"
  }
}
