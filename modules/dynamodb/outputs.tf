output "table_name" {
  description = "Name of the DynamoDB messages table"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "ARN of the DynamoDB messages table"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "ID of the DynamoDB messages table"
  value       = aws_dynamodb_table.this.id
}
