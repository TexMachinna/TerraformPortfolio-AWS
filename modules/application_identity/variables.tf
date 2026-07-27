variable "project_name" {
  description = "Project name used in IAM resource names"
  type        = string
}

variable "environment_tag" {
  description = "Deployment nevironment"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB Table the EC2 application may access"
  type        = string
}
