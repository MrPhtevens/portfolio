locals {
  location    = "AustraliaSouthEast"

  environment = terraform.workspace

  env_prefixes = {
    dev     = "dev"
    uat     = "uat"
    staging = "staging"
    prod    = "prod"
  }

  global_tags = {
    source      = lower("Terraform")
    department  = lower("Machine Learning")
    project     = lower(var.project_name)
  }

  # Naming conventions
  # Example: COMPANY-AUE-RG-PROJECTNAME-DEV01
  resource_group_name                               = "EXAMPLE-AUE-RG-${upper(var.project_name)}-${upper(local.env_prefixes[local.environment])}01"

  # Azure does not allow hyphen in storage name
  storage_account_name                              = "st${lower(var.project_name)}${lower(local.env_prefixes[local.environment])}01"

  function_app_storage_account_name                 = "stfunc${lower(var.project_name)}${lower(local.env_prefixes[local.environment])}01"

  function_app_name                                 = "func-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}01"

  function_app_app_insights_name                    = "appi-${local.function_app_name}"

  # Azure does not allow hyphen in container name
  container_registry_name                           = "cr${lower(var.project_name)}${lower(local.env_prefixes[local.environment])}01"

  key_vault_name                                    = "kv-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}"

  machine_learning_workspace_storage_container_name = "azureml-blobstore"

  machine_learning_workspace_name                   = "mlw-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}01"

  machine_learning_workspace_app_insights_name      = "appi-${local.machine_learning_workspace_name}"

  machine_learning_compute_cluster_name             = "mlc2-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}01"

  python_version                                    = "3.11"
}
