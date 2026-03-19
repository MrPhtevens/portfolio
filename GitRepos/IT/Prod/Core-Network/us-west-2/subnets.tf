locals {
  subnets_sd_wan = {
    pdx-sd-wan-vpc-subnet-private-us-west-2a = {
      cidr_block        = "192.168.75.192/28"
      availability_zone = "us-west-2a"
      tags = {
        "Name"        = "pdx-sd-wan-vpc-subnet-private-us-west-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sd-wan"
      }
    }
    pdx-sd-wan-vpc-subnet-public-us-west-2a = {
      cidr_block        = "192.168.75.208/28"
      availability_zone = "us-west-2a"
      tags = {
        "Name"        = "pdx-sd-wan-vpc-subnet-public-us-west-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sd-wan"
      }
    }
    pdx-sd-wan-vpc-subnet-private-us-west-2c = {
      cidr_block        = "192.168.75.224/28"
      availability_zone = "us-west-2c"
      tags = {
        "Name"        = "pdx-sd-wan-vpc-subnet-public-us-west-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sd-wan"
      }
    }
    pdx-sd-wan-vpc-subnet-public-us-west-2c = {
      cidr_block        = "192.168.75.240/28"
      availability_zone = "us-west-2c"
      tags = {
        "Name"        = "pdx-sd-wan-vpc-subnet-public-us-west-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "sd-wan"
      }
    }
  }
}

locals {
  subnets_pdx_transit_vpc = {
    pdx-transit-vpc-prod-public-us-west-2c = {
      cidr_block              = "192.168.77.240/28"
      availability_zone       = "us-west-2c"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "pdx-transit-vpc-prod-public-us-west-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "pdx-transit-vpc"
      }
    }

    pdx-transit-vpc-prod-intra-us-west-2a = {
      cidr_block              = "192.168.77.192/28"
      availability_zone       = "us-west-2a"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "pdx-transit-vpc-prod-intra-us-west-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "pdx-transit-vpc"
      }
    }

    pdx-transit-vpc-prod-public-us-west-2a = {
      cidr_block              = "192.168.77.224/28"
      availability_zone       = "us-west-2a"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "pdx-transit-vpc-prod-public-us-west-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "pdx-transit-vpc"
      }
    }

    pdx-transit-vpc-prod-intra-us-west-2c = {
      cidr_block              = "192.168.77.208/28"
      availability_zone       = "us-west-2c"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "pdx-transit-vpc-prod-intra-us-west-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "pdx-transit-vpc"
      }
    }
  }
}

resource "aws_subnet" "subnets_sd_wan" {
  for_each                = local.subnets_sd_wan
  vpc_id                  = aws_vpc.pdx-sd-wan-vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = false
  tags                    = each.value.tags
}

resource "aws_subnet" "pdx_transit_vpc" {
  for_each                = local.subnets_pdx_transit_vpc
  vpc_id                  = aws_vpc.pdx-transit-vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}

