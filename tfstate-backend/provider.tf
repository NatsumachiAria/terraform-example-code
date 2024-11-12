terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }

  backend "local" {}

// Change to this block when S3 bucket is created
  /*  backend "s3" {
    bucket = "pat-tfstate-backend"
    key = "our-remote-state/terraform.tfstate"
    dynamodb_table = "pat-tfstate-locking"
    region = "ap-southeast-1"
    encrypt = true
  } */ 
}

provider "aws" {
  region = var.aws_region
}