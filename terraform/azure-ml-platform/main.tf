# Data Source for Client Config
data "azurerm_client_config" "current" {}

# Create resource group
module "resource_group" {
  source                      = "./modules/azure/resource_group"
  resource_group_name         = local.resource_group_name
  location                    = local.location
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create project storage
module "storage_account" {
  source                      = "./modules/azure/storage_account"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  storage_account_name        = local.storage_account_name
  account_tier                = "Standard"
  account_replication_type    = "LRS"
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create global key vault for the workspace (environments)
module "key_vault" {
  source                      = "./modules/azure/key_vault"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  key_vault_name              = local.key_vault_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  object_id                   = data.azurerm_client_config.current.object_id
  sku_name                    = "standard"
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create log analytics workspace for function app
module "function_app_log_analytics_workspace" {
  source                        = "./modules/azure/log_analytics_workspace"
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  log_analytics_workspace_name  = "log-${local.function_app_app_insights_name}"
  sku                           = "PerGB2018"
  tags                          = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create application insights for function app
module "function_app_application_insights" {
  source                      = "./modules/azure/application_insights"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  application_insights_name   = local.function_app_app_insights_name
  workspace_id                = module.function_app_log_analytics_workspace.id
  application_type            = "web" # ios | java | MobileCenter | Node.JS | other | phone | store | web
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create storage for function app
module "function_app_storage_account" {
  source                      = "./modules/azure/storage_account"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  storage_account_name        = local.function_app_storage_account_name
  account_tier                = "Standard"
  account_replication_type    = "LRS"
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create app service plan for function app
module "function_app_service_plan" {
  source                      = "./modules/azure/service_plan"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  service_plan_name           = "sp-${local.function_app_name}"
  os_type                     = "Linux"   # Linux | Windows | WindowsContainer
  sku_name                    = "B1"
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create function app
module "function_app" {
  source                      = "./modules/azure/linux_function_app"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  function_app_name           = local.function_app_name
  app_service_plan_id         = module.function_app_service_plan.id
  storage_account_name        = module.function_app_storage_account.name
  storage_account_access_key  = module.function_app_storage_account.primary_access_key
  worker_runtime              = "python" # python | dotnet | node | java
  worker_runtime_version      = local.python_version
  environment_variables       = {
    "AzureWebJobsStorage"                         = module.storage_account.primary_connection_string
    "PYTHON_VERSION"                              = local.python_version
    "ApplicationInsightsAgent_EXTENSION_VERSION"  = "~2"
    "InstrumentationKey"                          = module.function_app_application_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"       = module.function_app_application_insights.connection_string
    "AZURE_KEY_VAULT_NAME"                        = module.key_vault.key_vault_name
    "BLOB_STORAGE_ACCOUNT"                        = module.storage_account.name
    "BLOB_STORAGE_CONNECTION_STRING"              = module.storage_account.primary_connection_string
    "BLOB_STORAGE_CONTAINER_NAME"                 = module.machine_learning_workspace_storage_container.name
    "MACHINE_LEARNING_WORKSPACE"                  = module.machine_learning_workspace.name
    "RESOURCE_GROUP"                              = module.resource_group.name
    "SUBSCRIPTION_ID"                             = data.azurerm_client_config.current.subscription_id
  }
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create key vault access policy for function app
module "function_app_key_vault_access_policy" {
  source                      = "./modules/azure/key_vault_access_policy"
  key_vault_id                = module.key_vault.key_vault_id
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  object_id                   = module.function_app.principal_id
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)

  secret_permissions          = ["Get", "List"]
  key_permissions             = ["Get", "List"]
  storage_permissions         = ["Get", "List"]
}

# Create container registry for docker images
module "azurerm_container_registry" {
  source                      = "./modules/azure/container_registry"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  container_registry_name     = local.container_registry_name
  sku                         = "Basic"
  admin_enabled               = true
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create storage container (blob store) for machine learning workspace
module "machine_learning_workspace_storage_container" {
  source                          = "./modules/azure/storage_container"
  storage_container_name  = local.machine_learning_workspace_storage_container_name
  storage_account_id              = module.storage_account.id
  container_access_type           = "private"
}

# Create log analytics workspace for machine learning workspace
module "machine_learning_workspace_log_analytics_workspace" {
  source                        = "./modules/azure/log_analytics_workspace"
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  log_analytics_workspace_name  = "log-${local.machine_learning_workspace_app_insights_name}"
  sku                           = "PerGB2018"
  tags                          = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create application insights for machine learning workspace
module "machine_learning_workspace_application_insights" {
  source                      = "./modules/azure/application_insights"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  application_insights_name   = local.machine_learning_workspace_app_insights_name
  workspace_id                = module.machine_learning_workspace_log_analytics_workspace.id
  application_type            = "web" # ios | java | MobileCenter | Node.JS | other | phone | store | web
  tags                        = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create machine learning workspace
module "machine_learning_workspace" {
  source                          = "./modules/azure/machine_learning_workspace"
  resource_group_name             = module.resource_group.name
  location                        = module.resource_group.location
  machine_learning_workspace_name = local.machine_learning_workspace_name
  application_insights_id         = module.machine_learning_workspace_application_insights.id
  key_vault_id                    = module.key_vault.key_vault_id
  storage_account_id              = module.storage_account.id
  container_registry_id           = module.azurerm_container_registry.id
  tags                            = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create machine learning compute cluster
module "machine_learning_compute_cluster" {
  source                                = "./modules/azure/machine_learning_compute_cluster"
  count                                 = lower(local.env_prefixes[local.environment]) == "dev" ? 1 : 0 # Only Dev

  location                              = module.resource_group.location
  machine_learning_compute_cluster_name = local.machine_learning_workspace_name
  machine_learning_workspace_id         = module.machine_learning_workspace.id
  max_node_count                        = 29
  min_node_count                        = 0
  scale_down_nodes_after_idle_duration  = "PT2M" # 2 minutes
  vm_priority                           = "Dedicated"
  vm_size                               = "Standard_DS11_v2"
  tags                                  = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create machine learning compute instance 01
module "machine_learning_compute_instance_01" {
  source                                  = "./modules/azure/machine_learning_compute_instance"
  count                                   = lower(local.env_prefixes[local.environment]) == "dev" ? 1 : 0 # Only Dev

  machine_learning_compute_instance_name  = "mlci-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}01"
  workspace_id                            = module.machine_learning_workspace.id
  vm_size                                 = "Standard_E4s_v3"
  identity_type                           = "SystemAssigned"
  assigned_user_emails                    = var.ml_compute_user_emails
  role_definition_name                    = "Contributor"

  tags                                    = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create machine learning compute instance 02
module "machine_learning_compute_instance_02" {
  source                                  = "./modules/azure/machine_learning_compute_instance"
  count                                   = lower(local.env_prefixes[local.environment]) == "dev" ? 1 : 0 # Only Dev

  machine_learning_compute_instance_name  = "mlci-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}02"
  workspace_id                            = module.machine_learning_workspace.id
  vm_size                                 = "Standard_E4s_v3"
  identity_type                           = "SystemAssigned"
  assigned_user_emails                    = var.ml_compute_user_emails
  role_definition_name                    = "Contributor"

  tags                                    = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}

# Create machine learning GPU instance 01
module "machine_learning_gpu_instance_01" {
  source                                  = "./modules/azure/machine_learning_compute_instance"
  count                                   = lower(local.env_prefixes[local.environment]) == "dev" ? 1 : 0 # Only Dev

  machine_learning_compute_instance_name  = "mlgpui-${lower(var.project_name)}-${lower(local.env_prefixes[local.environment])}01"
  workspace_id                            = module.machine_learning_workspace.id
  vm_size                                 = "Standard_NV12s_v3"
  identity_type                           = "SystemAssigned"
  assigned_user_emails                    = var.ml_compute_user_emails
  role_definition_name                    = "Contributor"

  tags                                    = merge({
    "environment" : lower(local.environment)
  }, local.global_tags)
}
