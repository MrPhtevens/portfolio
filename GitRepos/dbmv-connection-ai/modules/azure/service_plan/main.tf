# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_service_plan" "sp" {
  name                      = var.service_plan_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku_name                  = var.sku_name
  os_type                   = var.os_type
  worker_count              = var.worker_count
  zone_balancing_enabled    = var.zone_balancing_enabled
  per_site_scaling_enabled  = var.per_site_scaling_enabled
  tags                      = var.tags
}
