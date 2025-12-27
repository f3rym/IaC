resource "aws_instance" "server_production" {
    ami = var.ami
    instance_type = var.type
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = {
      name = var.stand_name
    }
}
//key-pair
resource "aws_key_pair" "key" {
    key_name = "mykey"
    public_key = file("~/.ssh/id_rsa.pub")
}
//security_groups
resource "aws_security_group" "sg" {
    name = "allow-all"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
// elastic ip
resource "aws_eip" "ip" {
    tags = {
      name = devops-eip
    }
}