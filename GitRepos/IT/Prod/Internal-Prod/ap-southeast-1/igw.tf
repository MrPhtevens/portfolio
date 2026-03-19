resource "aws_internet_gateway" "sin-workspaces-igw" {
  vpc_id = aws_vpc.sin-internal-workspaces-prod.id

  tags = {
    Name          = "sin-workspaces-igw"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sin-internal-workspaces"
  }
}
