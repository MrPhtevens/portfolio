### VPC ###

variable "oxf-internal-prod_vpc_name" {
  description = "OXF Internal Prod VPC"
  type        = string
  default     = "internal-prod"
}

variable "oxf-internal-prod_vpc_cidr" {
  description = "OXF Internal Prod VPC CIDR"
  type        = string
  default     = "192.168.70.0/24"
}

variable "oxf-internal-prod_vpc_azs" {
  description = "OXF Internal Prod VPC Availability Zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2c"]
}

variable "oxf-internal-prod_vpc_private_subnets" {
  description = "OXF Internal Prod VPC Private subnets"
  type        = list(string)
  default     = ["192.168.70.96/27", "192.168.70.128/27"]
}
variable "oxf-internal-prod_vpc_public_subnets" {
  description = "OXF Internal Prod VPC public subnets"
  type        = list(string)
  default     = ["192.168.70.32/27", "192.168.70.64/27"]
}
variable "oxf-internal-prod_vpc_db_subnets" {
  description = "OXF Internal Prod VPC public subnets"
  type        = list(string)
  default     = ["192.168.70.160/27", "192.168.70.192/27"]
}
variable "oxf-internal-prod_vpc_intra_subnets" {
  description = "OXF Internal Prod VPC public subnets"
  type        = list(string)
  default     = ["192.168.70.224/28", "192.168.70.240/28"]
}


###### Tags ######

variable "oxf-internal-prod_vpc_tags" {
  description = "OXF Internal Prod VPC Tags"
  type        = map(string)
  default = {
    Name        = "internal-prod"
    description = "Managed by Terraform"
    environment = "prod"
  }
}

variable "public_subnet_tags_per_az" {
  description = "Additional tags for the public subnets"
  type        = map(map(string))
  default = {
    "eu-west-2a" = {
      Name = "internal-prod-public-eu-west-2a"
    }
    "eu-west-2c" = {
      Name = "internal-prod-public-eu-west-2c"
    }
  }
}

variable "private_subnet_tags_per_az" {
  description = "Additional tags for the private subnets"
  type        = map(map(string))
  default = {
    "eu-west-2a" = {
      Name = "internal-prod-private-eu-west-2a"
    }
    "eu-west-2c" = {
      Name = "internal-prod-private-eu-west-2c"
    }
  }
}

variable "db_subnet_tags_per_az" {
  description = "Additional tags for the db subnets"
  type        = map(map(string))
  default = {
    "eu-west-2a" = {
      Name = "internal-prod-db-eu-west-2a"
    }
    "eu-west-2c" = {
      Name = "internal-prod-db-eu-west-2c"
    }
  }
}

variable "intra_subnet_tags_per_az" {
  description = "Additional tags for the db subnets"
  type        = map(map(string))
  default = {
    "eu-west-2a" = {
      Name = "internal-prod-intra-eu-west-2a"
    }
    "eu-west-2c" = {
      Name = "internal-prod-intra-eu-west-2c"
    }
  }
}

variable "public_route_table_tags" {
  type = map(string)
  default = {
    Name = "internal-prod-public-rtb"
  }
}

variable "private_route_table_tags" {
  type = map(string)
  default = {
    Name = "internal-prod-private-rtb"
  }
}

variable "default_route_table_tags" {
  type = map(string)
  default = {
    Name = "internal-prod-rtb-default"
  }
}

variable "default_security_group_tags" {
  type = map(string)
  default = {
    Name = "internal-prod-sg-default"
  }
}

variable "default_network_acl_tags" {
  type = map(string)
  default = {
    Name = "internal-prod-acl-default"
  }
}

