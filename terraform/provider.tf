terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.0"
    }
  }

  required_version = ">= 1.1.0"

  backend "azurerm" {
    # resource_group_name   = "terra"
    # storage_account_name  = "ulyterra"
    # container_name        = "container"
    # key                   = "github-actions.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "c29a99cc-ec40-4b28-8d9f-d36431a58c64"
}
