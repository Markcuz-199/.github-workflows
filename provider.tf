terraform {
  # The backend block MUST be inside the terraform block
  backend "s3" {
    bucket         = "my-unique-tf-bucket-2026" # <--- Check this matches your actual bucket
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}