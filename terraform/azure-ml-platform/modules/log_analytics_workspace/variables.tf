variable "log_analytics_workspace_name" {
  type        = string
  description = "(Required) Specifies the name of the Log Analytics Workspace."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region for all environments."
  type        = string
}

variable "sku" {
  type        = string
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. [PerNode | Premium | Standard | Standalone | Unlimited | CapacityReservation | PerGB2018 | LACluster.]"
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = string
  description = "(Optional) The workspace data retention in days."
  default     = "30"
}

variable "tags" {
  description = "The Azure resource tags."
  type        = map(string)
}
