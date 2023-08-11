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
  address_prefixes = [cidrsubnet(var.network_range,8,count.index)]
  #get the subnet names based on count from variable
  name = var.subnet_names[count.index]
  depends_on = [
    azurerm_resource_group.ntierazure,
    azurerm_virtual_network.ntier_vnet_azure
  ]

}
