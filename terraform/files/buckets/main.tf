provider "aws" {
  access_key = "AKIA6E6ZWCNVDYLTG75P"
  secret_key = "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"
  region  = "sa-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-hubdino000001"
  acl    = "private"

  tags = {
    Name        = "My super bucket"
    #Environment = "Dev"
    Environment = "Prod"
  }
}


# Aula de Interpolação
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "hello_world.txt"
  source = "arquivo.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("arquivo.txt")
}

output "bucket" {
  value = aws_s3_bucket.b.id
}

output "etag" {
  value = aws_s3_bucket_object.object.etag
}



