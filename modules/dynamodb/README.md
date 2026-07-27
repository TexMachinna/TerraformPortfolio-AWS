# DynamoDB module

## Overview

This module creates a DynamoDB Table, defining the Data Base layer for the
'TerraformPortfolio-AWS' project.

It creates:
- DynamoDB Table

## Usage

```text
module "dynamodb" {
  source = "../../modules/dynamodb"

  project_name    = var.project_name
  environment_tag = var.environment_tag

  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  deletion_protection_enabled = var.deletion_protection_enabled
}
```

## Inputs

| Name                          | Description                                                 | Type          | Required |
| ----------------------------- | ----------------------------------------------------------- | ------------- | -------- |
| `project_name`                | Name for the project, used to define a name for the table   | `string`      | yes      |
| `read_capacity`               | Provisioned read capacity units for the DynamoDB Table      | `number`      | yes      |
| `write_capacity`              | Provisioned write capacity units for the DynamoDB Table     | `number`      | yes      |
| `environment_tag`             | Tags applied to module resources                            | `string`      | yes      |
| `deletion_protection_enabled` | Whether DynamoDB deletion is enabled                        | `boolean`     | yes      |

## Outputs

| Name                    | Description                          |
| ----------------------- | ------------------------------------ |
| `table_name`            | Name of the DynamoDB messages table  |
| `table_arn`             | ARN of the DynamoDB messages table   |
| `table_id`              | ID of the DynamoDB messages table    |
| `asg_max_size`          | Maximum size of the ASG              |
| `asg_desired_size`      | Desired size for the ASG             |