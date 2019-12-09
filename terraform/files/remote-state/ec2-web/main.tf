provider "aws" {
  region = var.region
}

locals {
  ami_ub = aws_ami.ubuntu.id
}


terraform {
  backend "s3" {
    bucket = "curso-aws-terraform-remote-state-7c6f24b30f8aa751"
    key = "ec2/ecs.tfstate"
    region = "sa-east-1"
  }
}

data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent = true
  name_regex = "ubuntu"  
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type
}

