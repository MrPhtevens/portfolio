output "id" {
  description = "The ID of the Service Plan."
  value       = length(azurerm_service_plan.sp) > 0 ? azurerm_service_plan.sp.id : null
}

output "name" {
  description = "The name of the Service Plan."
  value       = length(azurerm_service_plan.sp) > 0 ? azurerm_service_plan.sp.name : null
}

output "location" {
  description = "The location of the Service Plan."
  value       = length(azurerm_service_plan.sp) > 0 ? azurerm_service_plan.sp.location : null
}

output "os_type" {
  description = "The OS type of the Service Plan."
  value       = length(azurerm_service_plan.sp) > 0 ? azurerm_service_plan.sp.os_type : null
}

output "sku_name" {
  description = "The SKU name of the Service Plan."
  value       = length(azurerm_service_plan.sp) > 0 ? azurerm_service_plan.sp.sku_name : null
}
