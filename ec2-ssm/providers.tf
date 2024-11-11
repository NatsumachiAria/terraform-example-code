terraform {
  backend "local" {

  }
  /*
  backend "s3" {
    bucket = "s3-test-state-backend-bucket"
    dynamodb_table = "tf-state-lock-978"
    key = "mystatefile/terraform.tfstate"
    region = "ap-southeast-1"
  }*/
  required_providers {
    aws = {
      version = ">=2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}