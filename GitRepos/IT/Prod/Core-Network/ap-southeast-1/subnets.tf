locals {
  subnets_transit = {
    sin-transit-vpc-prod-intra-ap-southeast-1a = {
      cidr_block              = "192.168.61.192/28"
      availability_zone       = "ap-southeast-1a"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "sin-transit-vpc-prod-intra-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sin-transit-vpc"
      }
    }
    sin-transit-vpc-prod-public-ap-southeast-1a = {
      cidr_block              = "192.168.61.224/28"
      availability_zone       = "ap-southeast-1a"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "sin-transit-vpc-prod-public-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sin-transit-vpc"
      }
    }
    sin-transit-vpc-prod-intra-ap-southeast-1c = {
      cidr_block              = "192.168.61.208/28"
      availability_zone       = "ap-southeast-1c"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "sin-transit-vpc-prod-intra-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sin-transit-vpc"
      }
    }
    sin-transit-vpc-prod-public-ap-southeast-1c = {
      cidr_block              = "192.168.61.240/28"
      availability_zone       = "ap-southeast-1c"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "sin-transit-vpc-prod-public-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sin-transit-vpc"
      }
    }
  }
}


resource "aws_subnet" "subnets_transit" {
  for_each                = local.subnets_transit
  vpc_id                  = aws_vpc.sin-transit-vpc-prod.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}

