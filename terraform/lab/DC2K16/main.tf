provider "aws" {
  region = var.region
}

locals {
  lab1_sg_id = concat(
    aws_security_group.lab1.*.id,
    [""],
  )[0]
}


resource "aws_vpc" "dc-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "VPC of DCs"
  }
}

resource "aws_subnet" "dc-subnet" {
  vpc_id = aws_vpc.dc-vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "dc-gw" {
  vpc_id = aws_vpc.dc-vpc.id
}

resource "aws_security_group" "lab1" {
  name = "Lab 1 SG"
  description = "Lab 1 Security Group"
  vpc_id = aws_vpc.dc-vpc.id

}

resource "aws_security_group_rule" "allow-RDP" {
    type = "ingress"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    security_group_id = aws_security_group.lab1.id
    cidr_blocks = ["0.0.0.0/0",]
}

resource "aws_security_group_rule" "allow-WinRM" {
    type = "ingress"
    from_port = 5985
    to_port = 5985
    protocol = "tcp"
    security_group_id = aws_security_group.lab1.id
    cidr_blocks = ["0.0.0.0/0",]
}

resource "aws_security_group_rule" "allow-out-ALL" {
    type = "egress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_group_id = aws_security_group.lab1.id
    cidr_blocks = ["0.0.0.0/0",]
}