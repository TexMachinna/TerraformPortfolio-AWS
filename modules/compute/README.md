# Compute module

## Overview

This module creates an AWS Auto Scaling Group, defining the compute layer for the 'TerraformPortfolio-AWS' project.

It creates:
- Launch template
- Auto Scaling Group

## Usage

```text
module "compute" {
  source = "../../modules/compute"

  environment_tag = var.environment_tag

  instance_type    = var.instance_type
  asg_desired_size = var.asg_desired_size
  asg_max_size     = var.asg_max_size
  asg_min_size     = var.asg_min_size

  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security.security_group_id
}
```

## Inputs

| Name                  | Description                                                 | Type          | Required |
| --------------------- | ----------------------------------------------------------- | ------------- | -------- |
| `instance_type`       | Type (size) of instance to be used                          | `string`      | yes      |
| `subnet_id`           | IPv4 blocks allowed to SSH the resources                    | `string`      | yes      |
| `environment_tag`     | Tags applied to module resources                            | `string`      | yes      |
| `security_group_id`   | ID of the security group assigned to the compute resources  | `string`      | yes      |
| `asg_min_size`        | Minimum size for the ASG                                    | `number`      | yes      |
| `asg_max_size`        | Maximum size for the ASG                                    | `number`      | yes      |
| `asg_desired_size`    | Desired size for the ASG                                    | `number`      | yes      |

## Outputs

| Name                    | Description                  |
| ----------------------- | ---------------------------- |
| `asg_id`                | ID of the compute ASG        |
| `asg_arn`               | ARN of the compute ASG       |
| `asg_min_size`          | Minimum size of the ASG      |
| `asg_max_size`          | Maximum size of the ASG      |
| `asg_desired_size`      | Desired size for the ASG     |