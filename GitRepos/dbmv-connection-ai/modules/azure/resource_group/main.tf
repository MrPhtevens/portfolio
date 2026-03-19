# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.location
  tags      = var.tags
}
