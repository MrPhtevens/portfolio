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
  default     = "syd-sd-wan-vpc"
}

variable "sdwan_vpc_cidr" {
  description = "SD Wan VPC CIDR"
  type        = string
  default     = "192.168.50.192/26"
}

variable "sdwan_vpc_azs" {
  description = " SD Wan VPC Availability Zones"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2c"]
}

variable "sdwan_vpc_private_subnets" {
  description = "SD Wan VPC Private subnets"
  type        = list(string)
  default     = ["192.168.50.192/28", "192.168.50.208/28"]
}
variable "sdwan_vpc_public_subnets" {
  description = "SD Wan VPC public subnets"
  type        = list(string)
  default     = ["192.168.50.224/28", "192.168.50.240/28"]
}


###### Tags ######

variable "sdwan_vpc_tags" {
  description = "SD Wan VPC Tags"
  type        = map(string)
  default = {
    Name        = "syd-sd-wan-vg-vpc"
    description = "Managed by Terraform"
    environment = "prod"
  }
}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default = {
    Name = "syd-sd-wan-vpc-IGW"
  }
}

variable "public_subnet_tags_per_az" {
  description = "Additional tags for the public subnets"
  type        = map(map(string))
  default = {
    "ap-southeast-2a" = {
      Name = "syd-sd-wan-vpc-subnet-public-ap-southeast-2a"
    }
    "ap-southeast-2c" = {
      Name = "syd-sd-wan-vpc-subnet-public-ap-southeast-2c"
    }
  }
}

variable "private_subnet_tags_per_az" {
  description = "Additional tags for the private subnets"
  type        = map(map(string))
  default = {
    "ap-southeast-2a" = {
      Name = "syd-sd-wan-vpc-subnet-private-ap-southeast-2a"
    }
    "ap-southeast-2c" = {
      Name = "syd-sd-wan-vpc-subnet-private-ap-southeast-2c"
    }
  }
}

variable "public_route_table_tags" {
  type = map(string)
  default = {
    Name = "syd-sd-wan-public-rtb"
  }
}

variable "private_route_table_tags" {
  type = map(string)
  default = {
    Name = "syd-sd-wan-private-rtb"
  }
}

variable "default_route_table_tags" {
  type = map(string)
  default = {
    Name = "syd-sd-wan-rtb-default"
  }
}

variable "default_security_group_tags" {
  type = map(string)
  default = {
    Name = "syd-sd-wan-sg-default"
  }
}

variable "default_network_acl_tags" {
  type = map(string)
  default = {
    Name = "syd-sd-wan-acl-default"
  }
}

