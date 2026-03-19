# Reference the existing batch account (instead of creating a new one)
data "azurerm_batch_account" "bacc" {
  name                = "batchaccount01"  # Name of your existing batch account
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Create a new storage account for the Batch Account
resource "azurerm_storage_account" "sc" {
  name                     = "batchstorageacct"  # Change to a unique name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "production"
  }
}

# Create a new batch pool using the existing Batch account
resource "azurerm_batch_pool" "bpool" {
  name                     = "batch-pool"
  account_name             = data.azurerm_batch_account.bacc.name
  resource_group_name      = data.azurerm_resource_group.rg.name
  vm_size                  = "STANDARD_D2S_V3"

  network_configuration {
    subnet_id = data.azurerm_subnet.sub.id
  }

  node_agent_sku_id        = "batch.node.windows amd64"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-smalldisk-g2"
    version   = "latest"
  }

  fixed_scale {
    target_dedicated_nodes = 1
  }
}

# Create a production batch pool using the existing Batch account
resource "azurerm_batch_pool" "bpool_prod" {
  name                     = "prod-batch-pool"
  account_name             = data.azurerm_batch_account.bacc.name
  resource_group_name      = data.azurerm_resource_group.rg.name
  vm_size                  = "STANDARD_D2S_V3"

  network_configuration {
    subnet_id = data.azurerm_subnet.sub.id
  }

  node_agent_sku_id        = "batch.node.windows amd64"

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-smalldisk-g2"
    version   = "latest"
  }

  fixed_scale {
    target_dedicated_nodes = 1
  }
}
