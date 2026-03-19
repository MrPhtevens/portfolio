
resource "aws_vpc" "pdx-transit-vpc" {
  cidr_block           = "192.168.77.128/25"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "pdx-transit-vpc-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "pdx-transit-vpc"
  }
}

resource "aws_vpc" "pdx-sd-wan-vpc" {
  cidr_block           = "192.168.75.192/26"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "pdx-sd-wan-vpc"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}