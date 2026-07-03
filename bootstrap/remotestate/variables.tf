variable "aws_region" {
  description = "AWS Region where the resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table_lock_name" {
  description = "Name for the DynamoDB Table responsible for locking"
  type        = string
  default     = "backend_lock"
}
