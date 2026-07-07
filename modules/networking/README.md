# Networking module

## Overview

This module provisions the core AWS networking layer for the 'TerraformPortfolio-AWS' project.

It creates:
- VPC
- Public subnet
- Private subnet
- Internet Gateway
- Public route table
- Public route table association

A NAT Gateway is intentionally omitted to reduce cost in this lab environment.

```text
VPC
├── Public Subnet
│   └── Route: 0.0.0.0/0 → Internet Gateway
└── Private Subnet
    └── Local VPC routing only
```
## Usage

```text
module "networking" {
  source = "../../modules/networking"

  vpc_block           = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  environment_tag     = "Dev"
}
```
## Inputs

| Name                  | Description                                 | Type          | Required |
| --------------------- | ------------------------------------------- | ------------- | -------- |
| `vpc_block`           | CIDR block for the VPC                      | `string`      | yes      |
| `public_subnet_cidr`  | CIDR block for the public subnet            | `string`      | yes      |
| `private_subnet_cidr` | CIDR block for the private subnet           | `string`      | yes      |
| `environment_tag`     | Tags applied to module resources            | `string`      | yes      |


## Outputs

| Name                    | Description                             |
| ----------------------- | --------------------------------------- |
| `vpc_id`                | ID of the created VPC                   |
| `public_subnet_id`      | ID of the public subnet                 |
| `private_subnet_id`     | ID of the private subnet                |
| `public_cidr_block`     | CIDR block assigned to the public subnet|
| `vpc_cidr_block`        | CIDR block assigned to the VPC          |

