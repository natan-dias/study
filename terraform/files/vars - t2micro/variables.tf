variable "region" {
  default = "sa-east-1"
  description = "Main region"
}

variable "access_key" {
  default = "AKIA6E6ZWCNVDYLTG75P"
}

variable "secret_key" {
  default = "wb41fh4mtu0k/15HkDuH06OBrcNvaqg1qeGh+eYA"
}

variable "ami" {
    default = "ami-07820a4443539a2b0"
  
}

variable "type" {
    default = "t2.micro"
  
}

variable "ips" {
  type = "list"
  default = ["2001:0db8:85a3:0000:0000:8a2e:0370:7334", "2001:0db8:85a3:0000:0000:8a2e:0370:7335"]
}

variable "tags" {
  type = "map"
  default = {
    "Name" = "Nodejs"
    "Env" = "Dev"
  }
}



