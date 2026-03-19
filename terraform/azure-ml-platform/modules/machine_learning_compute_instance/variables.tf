variable "machine_learning_compute_instance_name" {
  type        = string
  description = "Name of the compute instance"
}

variable "workspace_id" {
  type        = string
  description = "The ID of the Azure ML Workspace"
}

variable "vm_size" {
  type        = string
  default     = "Standard_DS3_v2"
  description = "Size of the compute instance VM"
}

variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "Identity type: SystemAssigned, UserAssigned, or SystemAssigned, UserAssigned"
}

variable "user_assigned_identity_ids" {
  type        = list(string)
  default     = []
  description = "List of User Assigned Managed Identity resource IDs"
}

variable "assigned_user_emails" {
  type        = list(string)
  default     = []
  description = "List of Azure AD user emails to assign access"
}

variable "role_definition_name" {
  type        = string
  default     = "Reader"
  description = "Role to assign (e.g., Reader, Contributor, Owner)"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
}
