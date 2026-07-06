# Security module

## Overview

This module provisions a security group and its designated ingress and egress rules for the 'TerraformPortfolio-AWS' project.

It creates:
- Security group
- Ingress rule (SSH)
- Egress rule

## Usage
 ```text
 module "security" {
  source = "../../modules/security"

  vpc_id          = module.networking.vpc_id
  environment_tag = var.environment_tag
  cidr_ipv4       = var.cidr_ipv4
}
 ```

## Inputs
| Name                  | Description                                 | Type          | Required |
| --------------------- | ------------------------------------------- | ------------- | -------- |
| `vpc_id`              | ID from the VPC                             | `string`      | yes      |
| `cidr_ipv4`           | IPv4 blocks allowed to SSH the resources    | `string`      | yes      |
| `environment_tag`     | Tags applied to module resources            | `string`      | yes      |

## Outputs
| Name                    | Description                  |
| ----------------------- | ---------------------------- |
| `security_group_id`     | ID of the EC2 security group |
| `security_group_arn`    | ARN of the EC2 security group|
