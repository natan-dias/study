provider "aws" {
  region  = var.region
}

resource "random_id" "bucket" { #Provider para gerar id randomica
  byte_length = 8
}

resource "random_id" "bucket_2" { #Provider para gerar id randomica
  byte_length = 4
}


module "bucket" {
  source = "./s3"  

  name = "my-bucket-${random_id.bucket.hex}"
  versioning = true

  tags = {
      Name =  "Anotações"
  }

  create_object = true
  object_key = "files/${random_id.bucket.dec}.txt"
  object_source = "file.txt"
}

module "bucket-2" {
  source = "./s3"  

  name = "my-bucket-${random_id.bucket_2.hex}"
}
