resource "azurerm_virtual_network" "production" {
  name                = "prod-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.mohan-kumar-bn.location
  resource_group_name = azurerm_resource_group.mohan-kumar-bn.name
}

resource "azurerm_subnet" "private" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.mohan-kumar-bn.name
  virtual_network_name = azurerm_virtual_network.production.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "subnetB" {
  name                = "example-nic"
  location            = azurerm_resource_group.mohan-kumar-bn.location
  resource_group_name = azurerm_resource_group.mohan-kumar-bn.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}
