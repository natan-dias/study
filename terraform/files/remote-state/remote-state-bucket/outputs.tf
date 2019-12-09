output "remote_state_bucket_name" {
  value = module.bucket.name
}

#output "remote_state_bucket_arn" {
#  value = module.bucket.arn #ARN é uma string que a AWS dá para os recursos
#}
