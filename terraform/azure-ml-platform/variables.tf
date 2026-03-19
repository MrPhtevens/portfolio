variable "project_name" {
  type        = string
  description = "The project name"
  default     = "connectionai"
}

variable "environments" {
  description = "A list of environments to deploy"
  type        = list(string)
  default     = ["dev", "uat", "staging", "prod"]
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = true
}

variable "client_id" {
  type        = string
  description = "Azure Client ID for service principal"
  sensitive   = true
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret for service principal"
  sensitive   = true
}

variable "ml_compute_user_emails" {
  type        = list(string)
  description = "List of user emails to assign to ML compute instances"
  default     = []
}
