terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ADD THIS BLOCK
  backend "s3" {
    bucket         = "my-unique-tf-bucket-2026"  # The name you used above
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

provider "aws" {
  region = "us-east-1"
}