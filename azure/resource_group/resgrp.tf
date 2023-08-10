terraform {
  required_version = "~> 1.5.4"
  required_providers {
   azurerm = {
    source = "hashicorp/azurerm"
    version = "~> 3.69.0"
   }
 }
}
provider "azurerm" {
    features {
      
    }
  
}
resource "azurerm_resource_group" "terraformresg" {
    name= "fromtf"
    location = "eastus"
  
}
resource "azurerm_storage_account" "terraform_storage_account" {
    name = "fromterraform"
    resource_group_name = "fromtf"
    location = "eastus"
    account_replication_type = "GRS"
    account_tier = "Standard"
    depends_on = [ azurerm_resource_group.terraformresg ]
  
}