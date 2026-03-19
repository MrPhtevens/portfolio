/*
# NLB
resource "aws_lb" "ftp_nlb" {
 name = "ftp-nlb"
 load_balancer_type = "network"
 subnets = [aws_subnet.sin-internal-prod["internal-prod-public-ap-southeast-1a"].id, aws_subnet.sin-internal-prod["internal-prod-public-ap-southeast-1c"].id]
 internal = false
}

# FTP Control (Port 21) Target Group
resource "aws_lb_target_group" "ftp_control_tg" {
 name = "ftp-control-tg"
 port = 21
 protocol = "TCP"
 vpc_id = aws_vpc.sin-internal-prod.id
}

resource "aws_lb_target_group_attachment" "ftp_control_attachment" {
 target_group_arn = aws_lb_target_group.ftp_control_tg.arn
 target_id = module.example-sin-web.id
 port = 21
}

resource "aws_lb_listener" "ftp_control_listener" {
 load_balancer_arn = aws_lb.ftp_nlb.arn
 port = 21
 protocol = "TCP"
 default_action {
 type = "forward"
 target_group_arn = aws_lb_target_group.ftp_control_tg.arn
 }
}

# Passive Ports Target Groups + Listeners (one per port)
resource "aws_lb_target_group" "ftp_passive_tg" {
 #count = var.ftp_passive_ports.end - var.ftp_passive_ports.start + 1
 #name_prefix = "ftp-passive-${count.index + var.ftp_passive_ports.start}-"
 port = 21
 protocol = "TCP"
 vpc_id = aws_vpc.sin-internal-prod.id
}

resource "aws_lb_target_group_attachment" "ftp_passive_attachment" {
 #count = var.ftp_passive_ports.end - var.ftp_passive_ports.start + 1
 target_group_arn = aws_lb_target_group.ftp_passive_tg[count.index].arn
 target_id = module.example-sin-web.id
 port = 21
}

resource "aws_lb_listener" "ftp_passive_listener" {
 #count = var.ftp_passive_ports.end - var.ftp_passive_ports.start + 1
 load_balancer_arn = aws_lb.ftp_nlb.arn
 port = 21
 protocol = "TCP"
 default_action {
 type = "forward"
 target_group_arn = aws_lb_target_group.ftp_passive_tg[count.index].arn
 }
}
*/
