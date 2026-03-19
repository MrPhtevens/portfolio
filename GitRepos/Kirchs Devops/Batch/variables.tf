# Reference the existing resource group
data "azurerm_resource_group" "rg" {
  name = "<your-resource-group-name>"
}

# Reference the existing resource group
data "azurerm_resource_group" "rgvnet" {
  name = "<your-network-resource-group-name>"
}

# Reference the existing virtual network
data "azurerm_virtual_network" "vnet" {
  name                = "<your-vnet-name>"
  resource_group_name = data.azurerm_resource_group.rgvnet.name
}

# Reference the existing subnet
data "azurerm_subnet" "sub" {
  name                 = "<your-subnet-name>"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rgvnet.name
}
