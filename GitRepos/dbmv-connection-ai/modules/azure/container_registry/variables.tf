variable "container_registry_name" {
  description = "The name of the Azure Container Registry. Must be globally unique."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location where the resource will be created."
  type        = string
}

variable "sku" {
  description = "The SKU name of the container registry. Possible values are Basic, Standard, Premium."
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}
