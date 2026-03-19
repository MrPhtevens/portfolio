resource "aws_internet_gateway" "netskope-igw" {
  vpc_id = aws_vpc.pdx-sd-wan-vpc.id

  tags = {
    Name          = "pdx-sd-wan-vpc-IGW"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }
}
