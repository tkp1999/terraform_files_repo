resource "azurerm_virtual_network" "ntier_vnet_azure" {
  name                = "ntier-vnet-azure"
  resource_group_name = azurerm_resource_group.ntierazure.name
  address_space       = [var.network_range]
  location            = azurerm_resource_group.ntierazure.location
  #explicit dependency created
  depends_on = [
    azurerm_resource_group.ntierazure
  ]

}
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  resource_group_name  = azurerm_resource_group.ntierazure.name
  virtual_network_name = azurerm_virtual_network.ntier_vnet_azure.name
  #get the address prefixes based on count from variiable
  address_prefixes = [cidrsubnet(var.network_range, 8, count.index)]
  #get the subnet names based on count from variable
  name = var.subnet_names[count.index]
  depends_on = [
    azurerm_resource_group.ntierazure,
    azurerm_virtual_network.ntier_vnet_azure
  ]

}

resource "azurerm_network_security_group" "webnsg" {
  name                = var.network_security_group_config.name
  resource_group_name = azurerm_resource_group.ntierazure.name
  location            = azurerm_resource_group.ntierazure.location
  depends_on = [
    azurerm_resource_group.ntierazure
  ]
}

resource "azurerm_network_security_rule" "webnsgrules" {
  count                       = length(var.network_security_group_config.rule)
  name                        = var.network_security_group_config.rule[count.index].name
  resource_group_name         = azurerm_resource_group.ntierazure.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = var.network_security_group_config.rule[count.index].protocol
  source_address_prefix       = var.network_security_group_config.rule[count.index].source_address_prefix
  source_port_range           = var.network_security_group_config.rule[count.index].source_port_range
  destination_port_range      = var.network_security_group_config.rule[count.index].destination_port_range
  direction                   = var.network_security_group_config.rule[count.index].direction
  priority                    = var.network_security_group_config.rule[count.index].priority
  access                      = var.network_security_group_config.rule[count.index].access
  destination_address_prefix  = var.network_security_group_config.rule[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.webnsg]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = var.appnsg_config.name
  resource_group_name = azurerm_resource_group.ntierazure.name
  location            = azurerm_resource_group.ntierazure.location
  depends_on = [
    azurerm_resource_group.ntierazure
  ]
}

resource "azurerm_network_security_rule" "appnsgrules" {
  count                       = length(var.appnsg_config.rule)
  name                        = var.appnsg_config.rule[count.index].name
  resource_group_name         = azurerm_resource_group.ntierazure.name
  network_security_group_name = azurerm_network_security_group.appnsg.name
  protocol                    = var.appnsg_config.rule[count.index].protocol
  source_address_prefix       = var.appnsg_config.rule[count.index].source_address_prefix
  source_port_range           = var.appnsg_config.rule[count.index].source_port_range
  destination_port_range      = var.appnsg_config.rule[count.index].destination_port_range
  direction                   = var.appnsg_config.rule[count.index].direction
  priority                    = var.appnsg_config.rule[count.index].priority
  access                      = var.appnsg_config.rule[count.index].access
  destination_address_prefix  = var.appnsg_config.rule[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.appnsg]
}

/*
resource "azurerm_network_security_group" "webnsg" {
  name                = "webnsg"
  resource_group_name = azurerm_resource_group.ntierazure.name
  location            = azurerm_resource_group.ntierazure.location
  depends_on = [
    azurerm_resource_group.ntierazure
  ]
}
resource "azurerm_network_security_rule" "webnsgrules_http" {
  name                        = "openhttp"
  resource_group_name         = azurerm_resource_group.ntierazure.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  direction                   = "Inbound"
  priority                    = "300"
  access                      = "Allow"
}
resource "azurerm_network_security_rule" "webnsgrules_ssh" {
  name                        = "openssh"
  resource_group_name         = azurerm_resource_group.ntierazure.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  access                      = "Allow"
  priority                    = "310"

}
*/