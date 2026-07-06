output "vpc_cidr_block" {
  value       = aws_vpc.this.cidr_block
  description = "CIDR block assigned to the VPC"
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet.id
  description = "Public subnet ID"
}

output "private_subnet_id" {
  value       = aws_subnet.private_subnet.id
  description = "Private subnet ID"
}

output "public_cidr_block" {
  value       = aws_subnet.public_subnet.cidr_block
  description = "CIDR block assigned to the public subnet"
}
