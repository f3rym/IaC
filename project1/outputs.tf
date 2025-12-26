output "instance_id" {
    value = aws_instance.server_production.id
}
output "ip" { value = aws_instance.server.public_ip }