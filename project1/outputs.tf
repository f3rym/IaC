output "instance_id" {
    value = aws_instance.server_production.id
    description = "Access point ec2"
}
output "ip" { 
    value = aws_instance.server_production.public_ip 
    description = "IP address my EC2"
}
output "ip_elastic" {
   value = aws_eip.ip.address
}