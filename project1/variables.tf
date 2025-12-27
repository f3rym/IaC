variable "region" {
    default = "us-east-1"
    description = "AWS Region"
}
variable "ami" {
    default = "ami-053b0d53c279acc90"
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
