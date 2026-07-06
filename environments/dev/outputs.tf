# Network outputs
output "vpc_cidr_block" {
  value       = module.networking.vpc_cidr_block
  description = "CIDR block assigned to the VPC"
}

output "vpc_id" {
  value       = module.networking.vpc_id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = module.networking.public_subnet_id
  description = "Public subnet ID"
}

output "private_subnet_id" {
  value       = module.networking.private_subnet_id
  description = "Private subnet ID"
}

output "public_cidr_block" {
  value       = module.networking.public_cidr_block
  description = "CIDR block assigned to the public subnet"
}

# Security outputs
output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = module.security.security_group_id
}

output "security_group_arn" {
  description = "ARN of the EC2 security group"
  value       = module.security.security_group_arn
}
