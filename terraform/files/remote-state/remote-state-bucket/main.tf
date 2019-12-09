provider "aws" {
  region = var.region
}

locals { #Criar locals para referenciar funções
  bucket_name = "${var.bucket_name}-${random_id.bucket.hex}"
}


resource "random_id" "bucket" {
  byte_length = 8
  
}

module "bucket" {
  source = "./s3"

  name       = local.bucket_name
  versioning = true

  tags = {
    Env  = var.env
    Name = "Terraform Remote State"
  }
}


