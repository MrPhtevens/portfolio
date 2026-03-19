# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_machine_learning_compute_cluster" "mlc2" {
  name                          = var.machine_learning_compute_cluster_name
  location                      = var.location
  vm_priority                   = var.vm_priority
  vm_size                       = var.vm_size
  machine_learning_workspace_id = var.machine_learning_workspace_id

  scale_settings {
    min_node_count                       = var.min_node_count
    max_node_count                       = var.max_node_count
    scale_down_nodes_after_idle_duration = var.scale_down_nodes_after_idle_duration
  }

  identity {
    type = "SystemAssigned"
  }
}
