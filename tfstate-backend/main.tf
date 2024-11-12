
// Create S3 bucket for collect shared state file 

resource "aws_s3_bucket" "pat-tfstate-backend" {
  bucket = "pat-tfstate-backend"

  /* lifecycle {
    prevent_destroy = true
  } */

  // Use this cmd to recursive deletion all file in bucket
  // aws s3 rm --recursive s3://bucket-name

  tags = {
    "Environment": "Dev"
  }

}

resource "aws_s3_bucket_versioning" "pat-tfstate-versioning" {
  bucket = aws_s3_bucket.pat-tfstate-backend.id

  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "pat-encrypted_sse_backend_bucket" {
  bucket = aws_s3_bucket.pat-tfstate-backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket                  = aws_s3_bucket.pat-tfstate-backend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


// Create dynamodb for state locking

resource "aws_dynamodb_table" "pat-tfstate-locking" {
  name         = "pat-tfstate-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  // Used for enable deletion protection
  //deletion_protection_enabled = "true"
}

/* resource "aws_instance" "bastion" {
  ami = "ami-01811d4912b4ccb26"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0446f23af73580b6c"]
  tags = {
    Name = "bastion"
  }

} */


/*
output "s3_bucket_arn" {
  value       = aws_s3_bucket.pat-tfstate-backend.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.pat-tfstate-locking.name
  description = "The name of the DynamoDB table"
}
*/


