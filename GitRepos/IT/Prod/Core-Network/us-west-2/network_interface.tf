##Netscope Primary Setup
resource "aws_network_interface" "Netskope_Hub_LAN" {
  subnet_id       = aws_subnet.subnets_sd_wan["pdx-sd-wan-vpc-subnet-private-us-west-2a"].id
  description     = "Netskope-Hub-LAN"
  security_groups = [aws_security_group.sin_sd_wan_private.id]

  # Disable Source/Destination check for the LAN interface
  source_dest_check = false
  tags = {
    "Name"        = "Netskope-Hub-LAN"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

resource "aws_network_interface" "Netskope_Hub_WAN" {
  subnet_id       = aws_subnet.subnets_sd_wan["pdx-sd-wan-vpc-subnet-public-us-west-2a"].id
  description     = "Netskope-Hub-WAN"
  security_groups = [aws_security_group.sin_sd_wan_public.id]

  tags = {
    "Name"        = "Netskope_Hub_WAN"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

resource "aws_eip" "one" {
  domain            = "vpc"
  network_interface = aws_network_interface.Netskope_Hub_WAN.id
  tags = {
    "Name"        = "Netskope-Hub-WAN-EIP"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}
##Netscope HA Setup
resource "aws_network_interface" "Netskope_Hub_LAN_HA" {
  subnet_id       = aws_subnet.subnets_sd_wan["pdx-sd-wan-vpc-subnet-private-us-west-2c"].id
  description     = "Netskope-Hub-LAN"
  security_groups = [aws_security_group.sin_sd_wan_private.id]

  # Disable Source/Destination check for the LAN interface
  source_dest_check = false
  tags = {
    "Name"        = "Netskope-Hub-LAN_HA"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

resource "aws_network_interface" "Netskope_Hub_WAN_HA" {
  subnet_id       = aws_subnet.subnets_sd_wan["pdx-sd-wan-vpc-subnet-public-us-west-2c"].id
  description     = "Netskope-Hub-WAN"
  security_groups = [aws_security_group.sin_sd_wan_public.id]

  tags = {
    "Name"        = "Netskope_Hub_WAN_HA"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

resource "aws_eip" "two" {
  domain            = "vpc"
  network_interface = aws_network_interface.Netskope_Hub_WAN_HA.id
  tags = {
    "Name"        = "Netskope-Hub-WAN-EIP-HA"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}