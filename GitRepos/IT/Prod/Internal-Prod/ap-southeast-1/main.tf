provider "aws" {
  region  = "ap-southeast-1"
  profile = "<your-aws-profile>"
}

module "example-sin-sql" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = "ami-00000000000000000" #AMI ID
  name   = "example-sin-sql03"     #Enter Name

  instance_type          = "r7i.4xlarge"
  key_name               = "<your-key-pair-name>"
  availability_zone      = "ap-southeast-1a"
  vpc_security_group_ids = [aws_security_group.Internal-Prod.id]
  subnet_id              = aws_subnet.sin-internal-prod["internal-prod-private-ap-southeast-1a"].id

  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = false
      iops                  = 3000
      throughput            = 125
      volume_size           = 200
      volume_type           = "gp3"
    }
  ]

  tags = {
    "Name"        = "example-sin-sql03"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "internal"
  }
}

module "example-sin-web" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = "ami-00000000000000000" #server 2019 base
  name   = "example-sin-web02"     #Enter Name

  instance_type          = "r6i.2xlarge"
  key_name               = "<your-key-pair-name>"
  availability_zone      = "ap-southeast-1a"
  vpc_security_group_ids = [aws_security_group.Internal-Prod.id]
  subnet_id              = aws_subnet.sin-internal-prod["internal-prod-private-ap-southeast-1a"].id

  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = false
      iops                  = 3000
      throughput            = 125
      volume_size           = 200
      volume_type           = "gp3"
    }
  ]
  tags = {
    "Name"        = "example-sin-web02"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "internal"
  }
}
