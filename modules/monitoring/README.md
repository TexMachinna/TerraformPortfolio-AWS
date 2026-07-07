# Monitoring module

## Overview

This module creates a CloudWatch Metric Alarm to monitor CPU usage for the assigned ASG

It creates:
- CloudWatch Metric Alarm

## Usage
```text
module "monitoring" {
  source = "../../modules/monitoring"

  environment_tag = var.environment_tag

  asg_name               = module.compute.asg_name
  cloudwatch_threshold   = var.cloudwatch_threshold
  cloudwatch_period      = var.cloudwatch_period
  cloudwatch_eval_period = var.cloudwatch_eval_period
}
```

## Inputs

| Name                      | Description                                                                | Type          | Required |
| ------------------------- | -------------------------------------------------------------------------- | ------------- | -------- |
| `asg_name`                | Name of the ASG resource                                                   | `string`      | yes      |
| `environment_tag`         | Tags applied to module resources                                           | `string`      | yes      |
| `cloudwatch_period`       | Period (intervals) for the CloudWatch Metric alarm                         | `number`      | yes      |
| `cloudwatch_eval_period`  | Periods over which data is being compared against the specified threshold  | `number`      | yes      |
| `cloudwatch_threshold`    | CPU utilization threshold for the CloudWatch Metric alarm                  | `number`      | yes      |

## Outputs

| Name                              | Description                                     |
| --------------------------------- | ----------------------------------------------- |
| `cloudwatch_metric_arn`           | ARN for the CloudWatch Metric                   |
| `cloudwatch_metric_cpu_threshold` | CPU threshold for the alarm to be triggered     |
| `cloudwatch_period`               | Period in which the metric operates             |