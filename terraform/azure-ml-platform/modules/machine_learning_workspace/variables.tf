variable "machine_learning_workspace_name" {
  description = "Name of the Azure Machine Learning Workspace."
  type        = string
}

variable "location" {
  description = "Azure location for the workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "application_insights_id" {
  description = "ID of the Application Insights instance."
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault instance."
  type        = string
}

variable "storage_account_id" {
  description = "ID of the Storage Account."
  type        = string
}

variable "container_registry_id" {
  description = "ID of the Azure Container Registry."
  type        = string
}

variable "tags" {
  description = "Tags to associate with the workspace."
  type        = map(string)
}
