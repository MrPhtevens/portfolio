resource "aws_security_group" "Internal-Prod" {
  name        = "Internal Prod - Domain controllers - DC03 and DC04"
  description = "Allow DC services"
  vpc_id      = aws_vpc.sin-internal-prod.id
  tags = {
    "Name" = "Domain controller services"
  }
}


resource "aws_security_group" "alb_sg" {
 name = "alb-sg"
 description = "Allow HTTPS traffic"
 vpc_id = aws_vpc.sin-internal-prod.id
 ingress {
 description = "HTTPS"
 from_port = 443
 to_port = 443
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
 from_port = 0
 to_port = 0
 protocol = "-1"
 cidr_blocks = ["0.0.0.0/0"]
 }
}

