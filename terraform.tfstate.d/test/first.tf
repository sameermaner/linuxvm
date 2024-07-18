terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }
}

provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "test-rg1" {
  name     = "test-rg1"
  location = "eastus"
}

resource "azurerm_public_ip" "pub-ip" {
  name                               = "pub-ip"
  resource_group_name = azurerm_resource_group.test-rg1.name
  location                          = azurerm_resource_group.test-rg1.location
  allocation_method       = "Static"

  tags = {
    environment = "Test"
  }
}
