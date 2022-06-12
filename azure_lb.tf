
resource "azurerm_public_ip" "PublicIPForLB" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.terraform1.location
  resource_group_name = azurerm_resource_group.terraform1.name
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.terraform1
  ]
}

resource "azurerm_lb" "wp_LoadBalancer" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.terraform1.location
  resource_group_name = azurerm_resource_group.terraform1.name
  #sku                 = "Standard"
  #sku_tier            = "Regional"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PublicIPForLB.id
  }

  depends_on = [
    azurerm_public_ip.PublicIPForLB
  ]
}

// Here we are defining the backend pool
resource "azurerm_lb_backend_address_pool" "scalesetpool" {
  loadbalancer_id = azurerm_lb.wp_LoadBalancer.id
  name            = "scalesetpool"
  depends_on = [
    azurerm_lb.wp_LoadBalancer
  ]
}

// Here we are defining the Load Balancing Rule
resource "azurerm_lb_rule" "RuleA" {
 # resource_group_name            = azurerm_resource_group.terraform1.name
  loadbalancer_id                = azurerm_lb.wp_LoadBalancer.id
  name                           = "RuleA"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.scalesetpool.id]
  depends_on = [
    azurerm_lb.wp_LoadBalancer
  ]
}

resource "azurerm_lb_rule" "RuleB" {
 # resource_group_name            = azurerm_resource_group.terraform1.name
  loadbalancer_id                = azurerm_lb.wp_LoadBalancer.id
  name                           = "RuleB"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.scalesetpool.id]
  depends_on = [
    azurerm_lb.wp_LoadBalancer
  ]
}

// Here we are defining the Health Probe
resource "azurerm_lb_probe" "ProbeA" {
 # resource_group_name = azurerm_resource_group
  loadbalancer_id     = azurerm_lb.wp_LoadBalancer.id
  name                = "probeA"
  port                = 80
  protocol            = "Tcp"
  depends_on = [
    azurerm_lb.wp_LoadBalancer
  ]
}

resource "azurerm_lb_probe" "ProbeB" {
 # resource_group_name = azurerm_resource_group
  loadbalancer_id     = azurerm_lb.wp_LoadBalancer.id
  name                = "probeB"
  port                = 22
  protocol            = "Tcp"
  depends_on = [
    azurerm_lb.wp_LoadBalancer
  ]
}