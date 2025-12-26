variable "region" {
    default = "us-east-1"
    description = "AWS Region"
}
variable "ami" {
    default = "ami-00831fc7c1e3ddc60"
    description = "Type OS"
}
variable "type" {
    default = "t2.micro"
    description = "Type hardware"
}
variable "stand_name" {
  default = "Demo system"
  description = "Name system in ec2"
}