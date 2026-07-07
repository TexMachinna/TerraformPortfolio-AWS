output "cloudwatch_metric_arn" {
  description = "ARN for the CloudWatch Metric"
  value       = aws_cloudwatch_metric_alarm.this.arn
}

output "cloudwatch_metric_cpu_threshold" {
  description = "CPU threshold for the alarm to be triggered"
  value       = aws_cloudwatch_metric_alarm.this.threshold
}

output "cloudwatch_period" {
  description = "Period in which the metric operates"
  value       = aws_cloudwatch_metric_alarm.this.period
}

