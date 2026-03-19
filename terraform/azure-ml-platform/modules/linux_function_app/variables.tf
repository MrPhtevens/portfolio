variable "function_app_name" {
  type        = string
  description = "Name of the Azure Function App."
}

variable "location" {
  type        = string
  description = "Azure location."
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where Function App will be deployed."
}

variable "app_service_plan_id" {
  type        = string
  description = "ID of the App Service Plan."
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account."
}

variable "storage_account_access_key" {
  type        = string
  description = "Access key for the Storage Account."
  sensitive   = true
}

variable "worker_runtime" {
  type        = string
  description = "The language runtime: python | dotnet | node | java"
}

variable "worker_runtime_version" {
  type        = string
  description = "The language runtime version: python | dotnet | node | java"
}

variable "runtime_version" {
  type        = string
  description = "Function runtime version (e.g. ~4)."
  default     = "~4"
}

variable "environment_variables" {
  type        = map(string)
  description = "Key-value map of environment variables to add to the Function App."
}

variable "always_on" {
  description = "Keep the app always on (required for some plans)."
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Function App."
}
