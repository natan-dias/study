variable "region" {
  default     = ""
  description = "main region"
}

variable "instance-tp" {
  default = "t2.micro"
}

variable "username" {
  default = ""
}

variable "cidr_block" {
  default = "192.168.0.0/16"
}

variable "ami" {
  default = "" #Amazon Linux
}

variable "key" {
  default = ""
}

