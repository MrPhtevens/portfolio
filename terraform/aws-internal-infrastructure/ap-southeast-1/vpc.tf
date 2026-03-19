resource "aws_vpc" "sin-internal-workspaces-prod" {
  cidr_block           = "192.168.59.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "sin-internal-workspaces-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sin-internal-workspaces"
  }
}

resource "aws_vpc" "sin-internal-prod" {
  cidr_block           = "192.168.63.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "sin-internal-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "internal"
  }
}

