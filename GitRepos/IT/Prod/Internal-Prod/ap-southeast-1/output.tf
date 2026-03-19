output "instance_id" {
  value = module.example-sin-sql.id
}
output "instance_id2" {
  value = module.example-sin-web.id
}

output "instance_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = module.example-sin-web.private_ip
}
