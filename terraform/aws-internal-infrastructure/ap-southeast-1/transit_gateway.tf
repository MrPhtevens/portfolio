resource "aws_ec2_transit_gateway" "sin-core-transit-gateway" {
  description = "Singapore - Core Network - Transit Gateway"
  tags = {
    Name = "sin-core-transit-gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "sin-internal-workspaces-vpc" {
  subnet_ids         = [aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1a"].id, aws_subnet.sin-internal-workspaces-prod["sin-internal-workspaces-prod-ap-southeast-1b"].id]
  transit_gateway_id = aws_ec2_transit_gateway.sin-core-transit-gateway.id
  vpc_id             = aws_vpc.sin-internal-workspaces-prod.id
  tags = {
    Name = "sin-internal-workspaces-vpc"
  }
}