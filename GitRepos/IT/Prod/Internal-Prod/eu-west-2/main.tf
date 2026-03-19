provider "aws" {
  region  = "eu-west-2"
  profile = "<your-aws-profile>"
}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.20.0"

  name = var.oxf-internal-prod_vpc_name
  cidr = var.oxf-internal-prod_vpc_cidr

  azs             = var.oxf-internal-prod_vpc_azs
  private_subnets = var.oxf-internal-prod_vpc_private_subnets
  public_subnets  = var.oxf-internal-prod_vpc_public_subnets

  database_subnets = var.oxf-internal-prod_vpc_db_subnets
  intra_subnets    = var.oxf-internal-prod_vpc_intra_subnets



  ## Tags ##
  public_subnet_tags_per_az   = var.public_subnet_tags_per_az
  private_subnet_tags_per_az  = var.private_subnet_tags_per_az
  db_subnet_tags_per_az  = var.db_subnet_tags_per_az
  intra_subnet_tags_per_az  = var.intra_subnet_tags_per_az
  public_route_table_tags     = var.public_route_table_tags
  private_route_table_tags    = var.private_route_table_tags
  default_route_table_tags    = var.default_route_table_tags
  default_security_group_tags = var.default_security_group_tags
  default_network_acl_tags    = var.default_network_acl_tags

  tags = var.oxf-internal-prod_vpc_tags
}
