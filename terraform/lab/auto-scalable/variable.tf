variable "region" {
  default     = "sa-east-1"
  description = "main region"
}

variable "instance-tp" {
  default = "t2.micro"
}

variable "username" {
  default = "admin"
}

variable "cidr_block" {
  default = "192.168.0.0/16"
}

variable "ami" {
  default = "ami-0e2c2c29d8017dd99" #Amazon Linux
}

variable "key" {
  default = "amazon_key_aws"
}

