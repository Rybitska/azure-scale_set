provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraform1" {
  name     = var.rg_name
  location = var.rg_region
}


resource "azurerm_virtual_network" "terraform_vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  address_space       = var.vnet_ip
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.terraform1.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.subnet1_ip
}

resource "azurerm_linux_virtual_machine_scale_set" "ss" {
  name                = var.ss_name
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  sku                 = var.vm_sku
  instances           = var.instance_number
  admin_username      = var.admin_user_name


  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = var.canonical_name
    offer     = var.UbuntuServer_name
    sku       = var.image_sku_name
    version   = "latest"
  }

  os_disk {
    storage_account_type = var.Standard_LRS_name
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name                                   = "${var.ss_name}-nic"
      primary                                = true
      subnet_id                              = azurerm_subnet.subnet1.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.scalesetpool.id]
    }
  }
 # depends_on = [
 #   azurerm_virtual_network.wp_LoadBalancer
 # ]
}

#need target group

//////////////// Sec Group //////////////

resource "azurerm_network_security_group" "app_nsg" {
  name                = "app-nsg"
  location            = azurerm_resource_group.terraform1.location
  resource_group_name = azurerm_resource_group.terraform1.name

  # We are creating a rule to allow traffic on port 80
  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
  depends_on = [
    azurerm_network_security_group.app_nsg
  ]
}
