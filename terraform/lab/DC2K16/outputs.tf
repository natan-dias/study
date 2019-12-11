output "VPC-ID" {
  value = aws_vpc.dc-vpc.id
}

output "password" {
  value = random_string.winrm_password.result
}

