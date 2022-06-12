
resource "azurerm_public_ip" "PublicIPForLB" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.terraform1.location
  resource_group_name = azurerm_resource_group.terraform1.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "TestLoadBalancer" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.terraform1.location
  resource_group_name = azurerm_resource_group.terraform1.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}


