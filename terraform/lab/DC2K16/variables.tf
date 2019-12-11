variable "region" {
  default     = "sa-east-1"
  description = "main region"
}

variable "ami-dc1" {
  default = "ami-0b27170c41289fc50"
}

variable "instance-tp" {
  default = "t2.micro"
}

variable "username" {
  default = "admin"  
}

