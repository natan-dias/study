variable "region" {
  default     = ""
  description = "main region"
}

variable "instance-tp" {
  default = "t2.micro"
}

variable "cidr_block" {
  default = "192.168.0.0/22"
}

variable "ami" {
    default = "ami-0528a5175983e7f28" # Amazon Linux 2
}

variable "key" {
    default = ""
}
