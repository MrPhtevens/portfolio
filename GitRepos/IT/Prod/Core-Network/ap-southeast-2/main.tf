provider "aws" {
  region  = "ap-southeast-2"
  profile = "<your-aws-profile>"
}


locals {

  user_data = <<-EOT
    #cloud-config
  password: <your-instance-password>
  chpasswd: { expire: False }
  ssh_pwauth: True
  EOT
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.20.0"

  name = var.sdwan_vpc_name
  cidr = var.sdwan_vpc_cidr

  azs             = var.sdwan_vpc_azs
  private_subnets = var.sdwan_vpc_private_subnets
  public_subnets  = var.sdwan_vpc_public_subnets

  ## Tags ##
  igw_tags                    = var.igw_tags
  public_subnet_tags_per_az   = var.public_subnet_tags_per_az
  private_subnet_tags_per_az  = var.private_subnet_tags_per_az
  public_route_table_tags     = var.public_route_table_tags
  private_route_table_tags    = var.private_route_table_tags
  default_route_table_tags    = var.default_route_table_tags
  default_security_group_tags = var.default_security_group_tags
  default_network_acl_tags    = var.default_network_acl_tags

  tags = var.sdwan_vpc_tags
}


### EC2 ###
module "Netskope-Hub" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = "ami-00000000000000000"
  name   = var.sdwan_netskope

  instance_type     = "c5.xlarge"
  key_name          = "Netskope-Hub-ap-southeast-2"
  availability_zone = "ap-southeast-2a"

  network_interface = [
    {
      device_index         = 0
      network_interface_id = aws_network_interface.Netskope_Hub_WAN.id
    },
    {
      device_index         = 1
      network_interface_id = aws_network_interface.Netskope_Hub_LAN.id
    }
  ]
  user_data_base64   = base64encode(local.user_data)
  enable_volume_tags = false
  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = false
      iops                  = 3000
      throughput            = 125
      volume_size           = 32
      volume_type           = "gp3"
    }
  ]

  tags = {
    "Name"        = "Netskope-Hub"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

module "Netskope-Hub-HA" {
  source            = "terraform-aws-modules/ec2-instance/aws"
  ami               = "ami-00000000000000000"
  name              = var.sdwan_netskope_ha
  instance_type     = "c5.xlarge"
  key_name          = "Netskope-Hub-ap-southeast-2"
  availability_zone = "ap-southeast-2c"

  network_interface = [
    {
      device_index         = 0
      network_interface_id = aws_network_interface.Netskope_Hub_WAN_HA.id
    },
    {
      device_index         = 1
      network_interface_id = aws_network_interface.Netskope_Hub_LAN_HA.id
    }
  ]

  user_data_base64   = base64encode(local.user_data)
  enable_volume_tags = false

  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = false
      iops                  = 3000
      throughput            = 125
      volume_size           = 32
      volume_type           = "gp3"
    }
  ]

  tags = {
    "Name"        = "Netskope-Hub-HA"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}
