#this is the resource group in which we add ntier in azure
resource "azurerm_resource_group" "ntierazure" {
  location = var.location
  name     = var.resource_group_name

}