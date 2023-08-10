resource "azurerm_virtual_network" "ntier_vnet_azure" {
  name                = "ntier-vnet-azure"
  resource_group_name = azurerm_resource_group.ntierazure.name
  address_space       = var.network_range
  location            = azurerm_resource_group.ntierazure.location
  #eplicit dependency created
  depends_on = [
    azurerm_resource_group.ntierazure
  ]

}