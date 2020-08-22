resource "azurerm_linux_virtual_machine" "linux-os" {
  name                = "linux-machine"
  resource_group_name = azurerm_resource_group.mohan-kumar-bn.name
  location            = azurerm_resource_group.mohan-kumar-bn.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.subnetB.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
