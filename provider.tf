terraform {
  # The backend block MUST be inside this terraform block
  backend "s3" {
    bucket         = "my-unique-tf-bucket-2026"  # <--- REPLACE THIS if your bucket name is different
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