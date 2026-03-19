variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region for all environments"
  type        = string
}

variable "tags" {
  description = "The Azure resource tags"
  type        = map(string)
}
