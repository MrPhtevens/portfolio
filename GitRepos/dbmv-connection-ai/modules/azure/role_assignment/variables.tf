variable "principal_id" {
  description = "(Required) The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to."
  type        = string
}

# see: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
variable "role_definition_name" {
  description = "(Optional) The name of a built-in Role. "
  type        = string
}

variable "scope" {
  description = "(Required) The scope at which the Role Assignment applies to."
  type        = string
}
