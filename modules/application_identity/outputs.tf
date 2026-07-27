output "instance_profile_name" {
  description = "Name of the IAM instance profile for the application instances"
  value       = aws_iam_instance_profile.this.name
}

output "instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.this.arn
}

output "role_name" {
  description = "Name of the application EC2 IAM role"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "ARN of the application EC2 IAM role"
  value       = aws_iam_role.this.arn
}

output "policy_arn" {
  description = "ARN of the DynamoDB access policy"
  value       = aws_iam_policy.dynamodb_access.arn
}
