output "region" {
  description = "Region where the S3 and DynamoDB resources dedicated to be the backend will be deployed"
  value = var.aws_region
}

output "s3_backend_bucket_arn" {
  description = "ARN for the S3 backend bucket"
  value       = aws_s3_bucket.s3_backend.arn
}

output "s3_backend_bucket_name" {
  description = "Name for the S3 backend bucket"
  value       = aws_s3_bucket.s3_backend.bucket
}

output "dynamodb_table_lock_name" {
  description = "Name for the DynamoDB table used for locking"
  value       = aws_dynamodb_table.terraform_locks.name
}
