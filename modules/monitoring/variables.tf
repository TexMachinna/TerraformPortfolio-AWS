variable "environment_tag" {
  description = "Tag assigned to each resource, depending on their environment"
  type        = string
}

variable "asg_name" {
  description = "Name of the ASG resource"
  type        = string
}

variable "cloudwatch_period" {
  description = "Period (intervals) for the CloudWatch Metric alarm"
  type        = number
}

variable "cloudwatch_eval_period" {
  description = "Periods over which data is being compared against the specified threshold"
  type        = number
}

variable "cloudwatch_threshold" {
  description = "CPU utilization threshold for the CloudWatch Metric alarm"
  type        = number
}
