rg_name           = "my_default_rg"
rg_region         = "Central US"
vnet_name         = "my_default_vnet"
vnet_ip           = ["10.0.0.0/16"]
subnet1_name      = "my_subnet1"
subnet1_ip        = ["10.0.1.0/24"]
ss_name           = "myss01-12346"
vm_sku            = "Standard_D2s_v3"
instance_number   = 1
admin_user_name   = "adminuser"
canonical_name    = "Canonical"
UbuntuServer_name = "UbuntuServer"
image_sku_name    = "18.04-LTS"
Standard_LRS_name = "Standard_LRS"

resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name = random_id.server.hex
  resource_group_name = azurerm_resource_group.terraform1.name

  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "traffic_manager"
    ttl = 100
  }

  monitor_config {
    protocol = "HTTP"
    port = 80
    path = "/"
    interval_in_seconds = 30
    timeout_in_seconds = 9
    tolerated_number_of_failures = 3
  }

}