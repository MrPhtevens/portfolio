variable "application_insights_name" {
  type        = string
  description = "Name of the Azure Application Insights."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure region for all environments."
  type        = string
}

variable "workspace_id" {
  type        = string
  description = "(Optional) Specifies the id of a log analytics workspace resource."
}

variable "application_type" {
  type        = string
  description = "Application type of the Application Insights. like [ios | java | MobileCenter | Node.JS | other | phone | store | web]."
}

variable "tags" {
  description = "The Azure resource tags."
  type        = map(string)
}
