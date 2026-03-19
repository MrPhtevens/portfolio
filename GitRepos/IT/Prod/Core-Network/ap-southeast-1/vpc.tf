resource "aws_vpc" "sin-transit-vpc-prod" {
  cidr_block           = "192.168.61.128/25"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name"        = "sin-transit-vpc-prod"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sin-transit-vpc"
  }
}