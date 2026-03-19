resource "aws_instance" "Netskope-Hub" {
  ami               = "ami-00000000000000000"
  instance_type     = "c5.xlarge"
  availability_zone = "us-west-2a"
  key_name          = "Netskope-Hub-us-west-2" # Replace with your key name if different

  network_interface {
    network_interface_id = aws_network_interface.Netskope_Hub_WAN.id
    device_index         = 0 # Primary Network Interface (WAN)
  }
  network_interface {
    network_interface_id = aws_network_interface.Netskope_Hub_LAN.id
    device_index         = 1 #  Secondary Network Interface (LAN)
  }

  tags = {
    "Name"        = "Netskope-Hub"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }

  user_data = <<EOF
#cloud-config
password: <your-instance-password>
chpasswd: { expire: False }
ssh_pwauth: True
EOF
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    throughput            = 125
    volume_size           = 32
    volume_type           = "gp3"
  }
}


## Netwskope HA Setup
resource "aws_instance" "Netskope-Hub-HA" {
  ami               = "ami-00000000000000000"
  instance_type     = "c5.xlarge"
  availability_zone = "us-west-2c"
  key_name          = "Netskope-Hub-us-west-2" # Replace with your key name if different

  network_interface {
    network_interface_id = aws_network_interface.Netskope_Hub_WAN_HA.id
    device_index         = 0 # Primary Network Interface (WAN)
  }
  network_interface {
    network_interface_id = aws_network_interface.Netskope_Hub_LAN_HA.id
    device_index         = 1 #  Secondary Network Interface (LAN)
  }

  tags = {
    "Name"        = "Netskope-Hub-HA"
    "description" = "Managed by Terraform"
    "environment" = "prod"
    "project"     = "sd-wan"
  }

  user_data = <<EOF
#cloud-config
password: <your-instance-password>
chpasswd: { expire: False }
ssh_pwauth: True
EOF
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    throughput            = 125
    volume_size           = 32
    volume_type           = "gp3"
  }
}