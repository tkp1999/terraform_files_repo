variable "resource_group_name" {
  type        = string
  default     = "ntierazure"
  description = "This is resource group name"
}
variable "location" {
  type        = string
  default     = "eastus"
  description = "This is default location in azure that i have mentioned for my projects"
}
variable "network_range" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is default network range"

}
/*
variable "subnet_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
  description = "These are subnet ranges"
}
*/
variable "subnet_names" {
  type        = list(string)
  default     = ["app", "web", "db"]
  description = "These are subnet names"

}
variable "network_security_group_config" {
  type = object({
    name = string
    rule = list(object({
      name                       = string
      protocol                   = string
      source_address_prefix      = string
      source_port_range          = string
      destination_port_range     = string
      priority                   = string
      access                     = string
      direction                  = string
      destination_address_prefix = string
    }))
  })
  default = {
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
    }]
  }

}

variable "appnsg_config" {
  type = object({
    name = string
    rule = list(object({
      name                       = string
      protocol                   = string
      source_address_prefix      = string
      source_port_range          = string
      destination_port_range     = string
      priority                   = string
      access                     = string
      direction                  = string
      destination_address_prefix = string
    }))
  })
  default = {
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
    }]
  }

}