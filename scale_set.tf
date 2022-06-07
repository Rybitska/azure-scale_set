resource "azurerm_resource_group" "terraform1" {
  name     = "tarraform1"
  location = "West US"
}

resource "azurerm_virtual_network" "terraform1" {
  name                = "terraform1"
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.terraform1.name
  virtual_network_name = azurerm_virtual_network.terraform1.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_linux_virtual_machine_scale_set" "ss" {
  name                = "ss-vmss"
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  sku                 = "Standard_F2"
  instances           = 1
  admin_username      = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "subnet1"
      primary   = true
      subnet_id = azurerm_subnet.subnet1.id
    }
  }
}