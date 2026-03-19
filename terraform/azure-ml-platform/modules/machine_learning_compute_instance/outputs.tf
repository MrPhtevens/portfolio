output "compute_instance_id" {
  value       = length(azurerm_machine_learning_compute_instance.mlci) > 0 ? azurerm_machine_learning_compute_instance.mlci.id : null
  description = "The ID of the ML compute instance"
}

output "compute_instance_name" {
  value       = length(azurerm_machine_learning_compute_instance.mlci) > 0 ? azurerm_machine_learning_compute_instance.mlci.name : null
  description = "The name of the ML compute instance"
}

output "identity" {
  value       = length(azurerm_machine_learning_compute_instance.mlci) > 0 ? azurerm_machine_learning_compute_instance.mlci.identity: null
  description = "Identity block of the compute instance"
}
