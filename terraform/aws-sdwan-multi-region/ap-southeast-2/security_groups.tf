resource "aws_security_group" "syd_sd_wan_private" {
  name        = "syd-sd-wan-private"
  description = "Security group for SD-WAN private access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "syd-sd-wan-private"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}

resource "aws_security_group" "syd_sd_wan_public" {
  name        = "syd-sd-wan-public"
  description = "Security group for SD-WAN public access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSL"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "IPSec"
    from_port   = 4500
    to_port     = 4500
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow SSH from internal"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as needed
  }

  ingress {
    description = "Allow ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as needed
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "syd-sd-wan-public"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}