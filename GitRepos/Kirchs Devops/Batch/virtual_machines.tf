resource "azurerm_network_interface" "vm_nic" {
  name                = "example-shir-vm-nic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "winvm" {
  name                  = "example-shir-vm-02"
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  size                  = "Standard_B4ms"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  os_disk {
    name                 = "winvm-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Reference an image from a Shared Image Gallery
  source_image_id = var.custom_image_id

  provision_vm_agent     = true
  enable_automatic_updates = true

  tags = {
    environment = "production"
  }
}
