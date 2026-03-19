output "id" {
  description = "ID of the Service Principal."
  value       = length(azuread_service_principal.sprin) > 0 ? azuread_service_principal.sprin.id : null
}


