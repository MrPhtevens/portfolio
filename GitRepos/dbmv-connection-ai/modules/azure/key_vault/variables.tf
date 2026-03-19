variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region for all environments"
  type        = string
}

variable "enabled_for_disk_encryption" {
  type        = string
  description = "(Optional) Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = false
}

variable "enable_rbac_authorization" {
  type        = string
  description = "(Optional) Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions."
  default     = true
}

variable "tenant_id" {
  type        = string
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "object_id" {
  type        = string
  description = "(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault."
}

variable "soft_delete_retention_days" {
  type        = string
  description = "(Optional) The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90"
  default     = 7
}

variable "purge_protection_enabled" {
  type        = string
  description = "(Optional) Is Purge Protection enabled for this Key Vault?"
  default     = true
}

variable "sku_name" {
  type        = string
  description = "(Required) The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "tags" {
  description = "The Azure resource tags"
  type        = map(string)
}
