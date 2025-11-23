terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "00d45210-35a3-4513-b94a-167b4dcefc83"
}

resource "azurerm_resource_group" "Pankaj" {
  name     = "Pankaj-resources"
  location = "centralindia"
}


# azurerm_storage_account.Pankaj_storage_account: Creating...
# ╷
# │ Error: creating Storage Account (Subscription: "00d45210-35a3-4513-b94a-167b4dcefc83"
# │ Resource Group Name: "Pankaj-resources"
# │ Storage Account Name: "pankajstorage"): performing Create: unexpected status 409 (409 Conflict) with error: StorageAccountAlreadyTaken: The storage account named pankajstorage 
# is already taken.
# │
# │   with azurerm_storage_account.Pankaj_storage_account,
# │   on main.tf line 20, in resource "azurerm_storage_account" "Pankaj_storage_account":
# │   20: resource "azurerm_storage_account" "Pankaj_storage_account" {
# │
# ╵

resource "azurerm_storage_account" "Pankaj_storage_account" {
  name = "pankajstorage2025"
  resource_group_name = azurerm_resource_group.Pankaj.name
  location = azurerm_resource_group.Pankaj.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}