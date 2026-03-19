# aws_vpc.syd-internal-prod:
resource "aws_vpc" "syd-internal-prod" {
  cidr_block           = "192.168.54.0/24"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name"        = "syd-internal-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "syd-internal"
  }
}

# aws_vpc.syd-internal-workspaces-prod:
resource "aws_vpc" "syd-internal-workspaces-prod" {

  cidr_block           = "192.168.52.0/24"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name"        = "syd-internal-workspaces-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "syd-internal-workspaces"
  }
}
