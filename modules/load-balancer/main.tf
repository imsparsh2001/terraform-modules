# Load Balancer
resource "azurerm_lb" "main" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb.id
  }
}

resource "azurerm_public_ip" "lb" {
  name                = "${var.lb_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb_backend_address_pool" "backend" {
  loadbalancer_id = azurerm_lb.main.id
  name            = var.backend_pool_name
}

resource "azurerm_lb_probe" "probe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.main.id
  name                = "health-probe"
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_rule" "rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.main.id
  name                           = "lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.frontend_ip_name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend.id
  probe_id                       = azurerm_lb_probe.probe.id
}
