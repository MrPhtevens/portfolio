
resource "aws_lb" "https_alb" {
 name = "https-alb"
 internal = false
 load_balancer_type = "application"
 security_groups = [aws_security_group.alb_sg.id]
 subnets = [aws_subnet.sin-internal-prod["internal-prod-public-ap-southeast-1a"].id, aws_subnet.sin-internal-prod["internal-prod-public-ap-southeast-1c"].id]
}

resource "aws_lb_target_group" "alb_tg" {
 name = "alb-https-tg"
 port = 80
 protocol = "HTTP"
 vpc_id = aws_vpc.sin-internal-prod.id
 target_type = "instance"
}

resource "aws_lb_target_group_attachment" "alb_attachment" {
 target_group_arn = aws_lb_target_group.alb_tg.arn
 target_id = "<your-target-instance-id>"
 port = 80
}


resource "aws_lb_listener" "https_listener" {
 load_balancer_arn = aws_lb.https_alb.arn
 port = 443
 protocol = "HTTPS"
 ssl_policy = "ELBSecurityPolicy-2016-08"
 certificate_arn = aws_acm_certificate.cert.arn
 default_action {
 type = "forward"
 target_group_arn = aws_lb_target_group.alb_tg.arn
 }
}
resource "aws_acm_certificate" "cert" {
  domain_name = "*.example.com"
}
