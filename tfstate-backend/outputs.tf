output "s3_remote_state_bucket_id" {
  value       = aws_s3_bucket.pat-tfstate-backend.id
  description = "The ID of the S3 bucket"
}

output "s3_remote_state_bucket_arn" {
  value       = aws_s3_bucket.pat-tfstate-backend.arn
  description = "The ARN of the S3 bucket"
}

output "s3_remote_state_bucket_name" {
  value       = aws_s3_bucket.pat-tfstate-backend.bucket
  description = "The name of the S3 bucket"
}

output "dynamodb_table_tfstate_locking_name" {
  value       = aws_dynamodb_table.pat-tfstate-locking.name
  description = "The name of the DynamoDB table"
}

output "dynamodb_table_tfstate_locking_arn" {
  value       = aws_dynamodb_table.pat-tfstate-locking.arn
  description = "The name of the DynamoDB table"
}