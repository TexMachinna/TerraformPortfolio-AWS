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

# Compute outputs
output "asg_id" {
  description = "ID of the compute ASG"
  value       = module.compute.asg_id
}

output "asg_name" {
  description = "Name of the ASG"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN of the compute ASG"
  value       = module.compute.asg_arn
}

output "asg_min_size" {
  description = "Minimum size of the ASG"
  value       = module.compute.asg_min_size
}

output "asg_max_size" {
  description = "Maximum size of the ASG"
  value       = module.compute.asg_max_size
}

output "asg_desired_size" {
  description = "Desired size for the ASG"
  value       = module.compute.asg_desired_size
}

# Monitoring outputs

output "cloudwatch_metric_arn" {
  description = "ARN for the CloudWatch Metric"
  value       = module.monitoring.cloudwatch_metric_arn
}

output "cloudwatch_metric_cpu_threshold" {
  description = "CPU threshold for the alarm to be triggered"
  value       = module.monitoring.cloudwatch_metric_cpu_threshold
}

output "cloudwatch_period" {
  description = "Period in which the metric operates"
  value       = module.monitoring.cloudwatch_period
}
