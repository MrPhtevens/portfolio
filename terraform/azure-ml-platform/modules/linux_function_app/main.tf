# see: https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_linux_function_app" "func" {
  name                          = var.function_app_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  service_plan_id               = var.app_service_plan_id
  storage_account_name          = var.storage_account_name
  storage_account_access_key    = var.storage_account_access_key
  functions_extension_version   = "~4"

  site_config {
    always_on = var.always_on
    application_stack {
      python_version = var.worker_runtime == "python" ? var.worker_runtime_version : null
    }
  }

  identity {
    type  = "SystemAssigned"
  }

  app_settings = merge({
    "FUNCTIONS_WORKER_RUNTIME"            = var.worker_runtime # python | dotnet | node | java
    "WEBSITE_RUN_FROM_PACKAGE"            = "1"
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"     = true
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = true
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = true
    "DATA_WAREHOUSE_CONNECTION_STRING"    = "DRIVER={ODBC Driver 18 for SQL Server};SERVER=<your-synapse-server>.sql.azuresynapse.net;DATABASE=<your-database>;UID=<your-username>;PWD={{PASSWORD}};Encrypt=yes;TrustServerCertificate=yes;"
  }, var.environment_variables)



  tags                          = var.tags
}
