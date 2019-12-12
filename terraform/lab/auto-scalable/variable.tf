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
