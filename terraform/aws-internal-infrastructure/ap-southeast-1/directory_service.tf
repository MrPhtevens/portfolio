resource "aws_directory_service_directory" "connector" {
  name     = "example.com"
  password = var.ad_connector_password
  size     = "Small"
  type     = "ADConnector"

  connect_settings {
    customer_dns_ips  = ["10.0.1.10", "10.0.2.10"]
    customer_username = "SVC_AWSADConnector"
    subnet_ids        = [aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1a"].id, aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1b"].id]
    vpc_id            = aws_vpc.sin-internal-workspaces-prod.id
  }

  tags = {
    Name          = "On Prem Connector"
    "description" = "Managed by Terraform"
    "environment" = "prod"
  }
}

resource "aws_workspaces_directory" "workspace_connector" {
  directory_id = aws_directory_service_directory.connector.id
  subnet_ids   = [aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1a"].id, aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1b"].id]
}
