output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.this.id
}

output "security_group_arn" {
  description = "ARN of the EC2 security group"
  value       = aws_security_group.this.arn
}
