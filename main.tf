terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
     aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
   # Configuration option
}
resource "random_string" "bucket_name" {
  length = 16
  special = false

}


resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket56buket"

  tags = {

    Name     = "My buckett"
    Environment  = "DEv"
  }
}

output "random_bucket_name_id" {
    value = random_string.bucket_name.id
}
output "random_bucket_name_result" {
    value = random_string.bucket_name.result
}