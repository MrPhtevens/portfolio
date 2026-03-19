locals {
  subnets_workspaces = {
    sin-internal-workspaces-prod-ap-southeast-1a = {
      cidr_block        = "192.168.59.0/25"
      availability_zone = "ap-southeast-1a"
      tags = {
        "Name"        = "internal-workspaces-prod-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal-workspaces-test"
      }
    }
    sin-internal-workspaces-prod-ap-southeast-1b = {
      cidr_block        = "192.168.59.128/25"
      availability_zone = "ap-southeast-1b"
      tags = {
        "Name"        = "internal-workspaces-prod-ap-southeast-1b"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal-workspaces-test"
      }
    }
  }

  subnets_internal = {
    internal-prod-intra-ap-southeast-1c = {
      cidr_block        = "192.168.63.240/28"
      availability_zone = "ap-southeast-1c"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-intra-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-intra-ap-southeast-1a = {
      cidr_block        = "192.168.63.224/28"
      availability_zone = "ap-southeast-1a"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-intra-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-public-ap-southeast-1c = {
      cidr_block        = "192.168.63.64/27"
      availability_zone = "ap-southeast-1c"
      map_public_ip     = true
      tags = {
        "Name"        = "internal-prod-public-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-public-ap-southeast-1a = {
      cidr_block        = "192.168.63.32/27"
      availability_zone = "ap-southeast-1a"
      map_public_ip     = true
      tags = {
        "Name"        = "internal-prod-public-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-db-ap-southeast-1a = {
      cidr_block        = "192.168.63.160/27"
      availability_zone = "ap-southeast-1a"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-db-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-db-ap-southeast-1c = {
      cidr_block        = "192.168.63.192/27"
      availability_zone = "ap-southeast-1c"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-db-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-private-ap-southeast-1c = {
      cidr_block        = "192.168.63.128/27"
      availability_zone = "ap-southeast-1c"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-private-ap-southeast-1c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
    internal-prod-private-ap-southeast-1a = {
      cidr_block        = "192.168.63.96/27"
      availability_zone = "ap-southeast-1a"
      map_public_ip     = false
      tags = {
        "Name"        = "internal-prod-private-ap-southeast-1a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "internal"
      }
    }
  }
}

resource "aws_subnet" "sin-internal-workspaces-prod" {
  for_each                = local.subnets_workspaces
  vpc_id                  = aws_vpc.sin-internal-workspaces-prod.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = false
  tags                    = each.value.tags
}

resource "aws_subnet" "sin-internal-prod" {
  for_each                = local.subnets_internal
  vpc_id                  = aws_vpc.sin-internal-prod.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip
  tags                    = each.value.tags

}
