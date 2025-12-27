//ami
data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}


resource "aws_instance" "server_production" {
    ami = data.aws_ami.amazon.id
    instance_type = var.type
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    tags = {
      name = var.stand_name
    }
}
//key-pair
resource "aws_key_pair" "key" {
    key_name = "xfusion-kp"
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
    instance = aws_instance.server_production.id
    tags = {
      name = "devops-eip"
    }
}
//volume 
resource "aws_ebs_volume" "volume" {
    availability_zone = var.region[1]
    size = 2
    type = "gp3"
    tags = {
      name = "datacenter-volume"
    }
}