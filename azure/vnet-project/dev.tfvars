resource_group_name = "ntier-dev"
location            = "eastus"
network_range       = "10.10.0.0/16"
#subnet_ranges       = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
subnet_names = ["app", "web", "db"]
network_security_group_config = {
  name = "webnsg"
  rule = [{
    name                       = "openhttp"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    priority                   = "300"
    access                     = "Allow"
    destination_address_prefix = "*"

    },
    {
      name                       = "openssh"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_port_range     = "22"
      direction                  = "Inbound"
      priority                   = "310"
      access                     = "Allow"
      destination_address_prefix = "*"
    }

  ]
}

appnsg_config = {
  name = "appnsg"
  rule = [{
    name                       = "open80"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    priority                   = "320"
    access                     = "Allow"
    destination_address_prefix = "*"

    },
    {
      name                       = "open22"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_port_range     = "22"
      direction                  = "Inbound"
      priority                   = "330"
      access                     = "Allow"
      destination_address_prefix = "*"
    },
    {
      name                       = "randomport"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_port_range     = "5000"
      direction                  = "Inbound"
      priority                   = "340"
      access                     = "Allow"
      destination_address_prefix = "*"
    }

  ]
}