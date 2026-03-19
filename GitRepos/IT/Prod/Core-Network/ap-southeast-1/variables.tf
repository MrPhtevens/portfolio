### EC2 ###

variable "sdwan_netskope" {
  description = "Name of Netskope SDWAN Instance"
  type        = string
  default     = "Netskope-Hub"
}

variable "sdwan_netskope_ha" {
  description = "Name of Netskope SDWAN Ha Instance"
  type        = string
  default     = "Netskope-Hub-HA"
}


### VPC ###

variable "sdwan_vpc_name" {
  description = "SD Wan VPC"
  type        = string
  default     = "sin-sd-wan-vpc"
}

variable "sdwan_vpc_cidr" {
  description = "SD Wan VPC CIDR"
  type        = string
  default     = "192.168.60.0/26"
}

variable "sdwan_vpc_azs" {
  description = " SD Wan VPC Availability Zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1c"]
}

variable "sdwan_vpc_private_subnets" {
  description = "SD Wan VPC Private subnets"
  type        = list(string)
  default     = ["192.168.60.0/28", "192.168.60.16/28"]
}
variable "sdwan_vpc_public_subnets" {
  description = "SD Wan VPC public subnets"
  type        = list(string)
  default     = ["192.168.60.32/28", "192.168.60.48/28"]
}


###### Tags ######

variable "sdwan_vpc_tags" {
  description = "SD Wan VPC Tags"
  type        = map(string)
  default = {
    Name        = "sin-sd-wan-vpc"
    description = "Managed by Terraform"
    environment = "prod"
  }
}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default = {
    Name = "sin-sd-wan-vpc-IGW"
  }
}

variable "public_subnet_tags_per_az" {
  description = "Additional tags for the public subnets"
  type        = map(map(string))
  default = {
    "ap-southeast-1a" = {
      Name = "sin-sd-wan-vpc-subnet-public-ap-southeast-1a"
    }
    "ap-southeast-1c" = {
      Name = "sin-sd-wan-vpc-subnet-public-ap-southeast-1c"
    }
  }
}

variable "private_subnet_tags_per_az" {
  description = "Additional tags for the private subnets"
  type        = map(map(string))
  default = {
    "ap-southeast-1a" = {
      Name = "sin-sd-wan-vpc-subnet-private-ap-southeast-1a"
    }
    "ap-southeast-1c" = {
      Name = "sin-sd-wan-vpc-subnet-private-ap-southeast-1c"
    }
  }
}

variable "public_route_table_tags" {
  type = map(string)
  default = {
    Name = "sin-sd-wan-public-rtb"
  }
}

variable "private_route_table_tags" {
  type = map(string)
  default = {
    Name = "sin-sd-wan-private-rtb"
  }
}

variable "default_route_table_tags" {
  type = map(string)
  default = {
    Name = "sin-sd-wan-rtb-default"
  }
}

variable "default_security_group_tags" {
  type = map(string)
  default = {
    Name = "sin-sd-wan-sg-default"
  }
}

variable "default_network_acl_tags" {
  type = map(string)
  default = {
    Name = "sin-sd-wan-acl-default"
  }
}

