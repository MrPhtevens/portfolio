variable "key_vault_id" {
  type        = string
  description = "Name of the Azure Key Vault."
}

variable "tenant_id" {
  type        = string
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "object_id" {
  type        = string
  description = "(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault."
}

# See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy
variable "certificate_permissions" {
  type        = list(string)
  description = " (Optional) List of certificate permissions"
  default = []
}

# See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy
variable "key_permissions" {
  type        = list(string)
  description = "(Optional) List of key permissions"
  default = []
}

# See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy
variable "secret_permissions" {
  type        = list(string)
  description = "(Optional) List of secret permissions"
  default = []
}

# See: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy
variable "storage_permissions" {
  type        = list(string)
  description = "(Optional) List of storage permissions"
  default = []
}

variable "tags" {
  description = "The Azure resource tags"
  type        = map(string)
}
