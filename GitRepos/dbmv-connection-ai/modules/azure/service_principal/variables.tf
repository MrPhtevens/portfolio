variable "display_name" {
  type        = string
  description = "The display name of the application associated with this service principal."
}

variable "client_id" {
  type        = string
  description = "(Required) The client ID of the application for which to create a service principal."
}

variable "owners" {
  type        = list(string)
  description = "(Optional) A set of object IDs of principals that will be granted ownership of the service principal."
  default = []
}

# see: https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal
variable "feature_tags" {
  description = " (Optional) A feature_tags block. Cannot be used together with the tags property."
  type        = map(string)
  default = {}
}
