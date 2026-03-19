variable "service_plan_name" {
  description = "Name of the Azure Service Plan."
  type        = string
}

variable "location" {
  description = "Azure region for the Service Plan."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group name."
  type        = string
}

# Use Y1 for consumption plans (Function App)
# Use EP1, EP2, etc. for Elastic Premium
# Use P1v2, P2v3, etc. for Premium V2/V3
# see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan#sku_name-1
variable "sku_name" {
  description = "SKU name for the plan (e.g. Y1, B1, P1v2, EP1)."
  type        = string
  default     = "Y1"
}

variable "os_type" {
  description = "The operating system type: Windows | Linux"
  type        = string
  default     = "Linux"
}

variable "worker_count" {
  description = "Number of workers to allocate. Only used for Premium and Isolated plans."
  type        = number
  default     = 1
}

variable "zone_balancing_enabled" {
  description = "Whether zone balancing is enabled."
  type        = bool
  default     = false
}

variable "per_site_scaling_enabled" {
  description = "If true, each app in the plan scales independently."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the Service Plan."
  type        = map(string)
}
