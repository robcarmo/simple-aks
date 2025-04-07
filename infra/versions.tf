terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "tfstatestoragecarmocloud"
    container_name        = "tfstate"
    key                   = "aks/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}