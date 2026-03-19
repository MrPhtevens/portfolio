output "compute_cluster_id" {
  value       = length(azurerm_machine_learning_compute_cluster.mlc2) > 0 ? azurerm_machine_learning_compute_cluster.mlc2.id : null
  description = "The ID of the compute cluster"
}

output "compute_cluster_name" {
  value       = length(azurerm_machine_learning_compute_cluster.mlc2) > 0 ? azurerm_machine_learning_compute_cluster.mlc2.name : null
  description = "The name of the compute cluster"
}

output "compute_cluster_location" {
  value       = length(azurerm_machine_learning_compute_cluster.mlc2) > 0 ? azurerm_machine_learning_compute_cluster.mlc2.location : null
  description = "The Azure location of the compute cluster"
}

