locals {
  subnets_prod = {
    syd-internal-prod-db-ap-southeast-2a = {
      cidr_block              = "192.168.54.160/27"
      availability_zone       = "ap-southeast-2a"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-db-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-db-ap-southeast-2c = {
      cidr_block              = "192.168.54.192/27"
      availability_zone       = "ap-southeast-2c"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-db-ap-southeast-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-intra-ap-southeast-2a = {
      cidr_block              = "192.168.54.224/28"
      availability_zone       = "ap-southeast-2a"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-intra-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-intra-ap-southeast-2c = {
      cidr_block              = "192.168.54.240/28"
      availability_zone       = "ap-southeast-2c"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-intra-ap-southeast-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-private-ap-southeast-2a = {
      cidr_block              = "192.168.54.96/27"
      availability_zone       = "ap-southeast-2a"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-private-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-private-ap-southeast-2c = {
      cidr_block              = "192.168.54.128/27"
      availability_zone       = "ap-southeast-2c"
      map_public_ip_on_launch = false
      tags = {
        "Name"        = "syd-internal-prod-private-ap-southeast-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-public-ap-southeast-2a = {
      cidr_block              = "192.168.54.32/27"
      availability_zone       = "ap-southeast-2a"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "syd-internal-prod-public-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
    syd-internal-prod-public-ap-southeast-2c = {
      cidr_block              = "192.168.54.64/27"
      availability_zone       = "ap-southeast-2c"
      map_public_ip_on_launch = true
      tags = {
        "Name"        = "syd-internal-prod-public-ap-southeast-2c"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal"
      }
    }
  }
}

locals {
  subnets_workspaces = {
    syd-internal-workspaces-prod-ad-ap-southeast-2a = {
      cidr_block        = "192.168.52.32/28"
      availability_zone = "ap-southeast-2a"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-ad-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-ad-ap-southeast-2b = {
      cidr_block        = "192.168.52.48/28"
      availability_zone = "ap-southeast-2b"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-ad-ap-southeast-2b"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-intra-ap-southeast-2a = {
      cidr_block        = "192.168.52.0/28"
      availability_zone = "ap-southeast-2a"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-intra-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-intra-ap-southeast-2b = {
      cidr_block        = "192.168.52.16/28"
      availability_zone = "ap-southeast-2b"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-intra-ap-southeast-2b"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-private-ap-southeast-2a = {
      cidr_block        = "192.168.52.128/26"
      availability_zone = "ap-southeast-2a"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-private-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-private-ap-southeast-2a-2 = {
      cidr_block        = "192.168.52.64/27"
      availability_zone = "ap-southeast-2a"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-private-ap-southeast-2a"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-private-ap-southeast-2b = {
      cidr_block        = "192.168.52.96/27"
      availability_zone = "ap-southeast-2b"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-private-ap-southeast-2b"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
    syd-internal-workspaces-prod-private-ap-southeast-2b-2 = {
      cidr_block        = "192.168.52.192/26"
      availability_zone = "ap-southeast-2b"
      tags = {
        "Name"        = "syd-internal-workspaces-prod-private-ap-southeast-2b"
        "description" = "Managed by Terraform"
        "environment" = "prod"
        "project"     = "syd-internal-workspaces"
      }
    }
  }
}

resource "aws_subnet" "subnets-prod" {
  for_each                = local.subnets_prod
  vpc_id                  = aws_vpc.syd-internal-prod.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}

resource "aws_subnet" "subnets-workspaces" {
  for_each                = local.subnets_workspaces
  vpc_id                  = aws_vpc.syd-internal-workspaces-prod.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = false
  tags                    = each.value.tags
}
