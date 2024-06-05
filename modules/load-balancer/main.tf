

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lbPublicIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "main" {
  name                = "myLoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "publicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.main.id
  name            = "myBackendPool"
}

resource "azurerm_lb_probe" "health_probe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.main.id
  name                = "http-probe"
  protocol            = "Http"
  request_path        = "/healthcheck"
  port                = 80
}

resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "httpRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "publicIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  probe_id                       = azurerm_lb_probe.health_probe.id
}
