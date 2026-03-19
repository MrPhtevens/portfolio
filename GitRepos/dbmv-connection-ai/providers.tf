# Define the required providers
terraform {
  backend "local" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.3"
    }
  }
}

# AWS provider configuration
provider "aws" {
  region = "ap-southeast-2"
  alias  = "aws-ap-southeast-2"
}

# Azure provider configuration
provider "azurerm" {
  use_msi                         = true
  use_cli                         = false
  use_oidc                        = false
  subscription_id                 = var.subscription_id
  tenant_id                       = var.tenant_id
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  features {}
}

# AzureAD provider configuration
provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
  alias         = "azure-entra-id"
}
