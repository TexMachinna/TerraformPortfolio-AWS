terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
  required_version = ">= 1.0.0, < 2.0.0"
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = "${var.environment_tag}_cpu_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cloudwatch_eval_period
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.cloudwatch_period
  statistic           = "Average"
  threshold           = var.cloudwatch_threshold
  alarm_description   = "Triggers when EC2 CPU usage is high"

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  tags = {
    Environment = var.environment_tag
  }
}
