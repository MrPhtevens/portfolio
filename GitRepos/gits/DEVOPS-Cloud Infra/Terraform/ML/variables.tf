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

variable "resource_groups" {
  description = "List of Azure Resource Groups with services and unique tags"
  type = list(object({
    name                       = string
    location                   = string
    tags                       = map(string)
    storage_acct_name          = string
    app_insights_name          = string
    container_reg_name         = optional(string)
    keyvault_name              = string
    function_app_name          = string
    function_storage_acct_name = string
    machine_learning_name      = string
    cluster_size               = string # Define for AZML Cluster size (Standard_DS11_v2)
    cluster_name               = string
  }))

  default = [
    {
      name                       = "EXAMPLE-AUE-RG-CONNECTIONAI-DEV01"
      location                   = "AustraliaEast"
      tags                       = { Environment = "Dev", Source = "Terraform" }
      storage_acct_name          = "stconnectionaidev01"
      app_insights_name          = "appi-connectionai-dev01"
      container_reg_name         = "crconnectionaidev01"
      keyvault_name              = "kv-connectionai-dev"
      function_app_name          = "func-connectionai-dev01"
      function_storage_acct_name = "stfuncconnectionaidev01"
      machine_learning_name      = "mlw-connectionai-dev01"
      cluster_size               = "Standard_DS11_v2"
      cluster_name               = "CONNECTIONAI-DEV01-CLUSTER"

    },
    {
      name                       = "EXAMPLE-AUE-RG-CONNECTIONAI-TEST01"
      location                   = "AustraliaEast"
      tags                       = { Environment = "Test", Source = "Terraform" }
      storage_acct_name          = "stconnectionaitest01"
      app_insights_name          = "appi-connectionai-test01"
      keyvault_name              = "kv-connectionai-test"
      function_app_name          = "func-connectionai-test01"
      function_storage_acct_name = "stfuncconnectionaitest01"
      machine_learning_name      = "mlw-connectionai-test01"
      cluster_size               = "Standard_DS11_v2"
      cluster_name               = "CONNECTIONAI-TEST01-CLUSTER"
    },
    {
      name                       = "EXAMPLE-AUE-RG-CONNECTIONAI-PROD01"
      location                   = "AustraliaEast"
      tags                       = { Environment = "Prod", Source = "Terraform" }
      storage_acct_name          = "stconnectionaiprod01"
      app_insights_name          = "appi-connectionai-prod01"
      keyvault_name              = "kv-connectionai-prod"
      function_app_name          = "func-connectionai-prod01"
      function_storage_acct_name = "stfuncconnectionaiprod01"
      machine_learning_name      = "mlw-connectionai-prod01"
      cluster_size               = "Standard_DS11_v2"
      cluster_name               = "CONNECTIONAI-PROD01-CLUSTER"
    }
  ]
}
variable "compute_instances_dev" {
  description = "List of compute instances with their names and types"
  type = list(object({
    name           = string
    size           = string
    assign_to_user = string
    tags           = map(string)
  }))
  default = [
    { name = "user1-compute-dev", size = "Standard_E4s_v3", assign_to_user = "<user-1-object-id>", tags = { Environment = "Dev", Source = "Terraform" } },
    { name = "user2-compute-dev", size = "Standard_E4s_v3", assign_to_user = "<user-2-object-id>", tags = { Environment = "Dev", Source = "Terraform" } },
    { name = "user2-gpu-dev", size = "Standard_NV12s_v3", assign_to_user = "<user-2-object-id>", tags = { Environment = "Dev", Source = "Terraform" } }
  ]
}
