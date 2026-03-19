# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azuread_service_principal" "sprin" {
  client_id = var.client_id
  display_name = var.display_name
}
