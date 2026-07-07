output "asg_id" {
  description = "ID of the compute ASG"
  value       = aws_autoscaling_group.this.id
}

output "asg_arn" {
  description = "ARN of the compute ASG"
  value       = aws_autoscaling_group.this.arn
}

output "asg_min_size" {
  description = "Minimum size of the ASG"
  value       = aws_autoscaling_group.this.min_size
}

output "asg_max_size" {
  description = "Maximum size of the ASG"
  value       = aws_autoscaling_group.this.max_size
}

output "asg_desired_size" {
  description = "Desired size for the ASG"
  value       = aws_autoscaling_group.this.desired_capacity
}
