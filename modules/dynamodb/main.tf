terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
  required_version = ">= 1.0.0, < 2.0.0"
}

locals {
  table_name = "${var.project_name}-${var.environment_tag}-messages"
}

resource "aws_dynamodb_table" "this" {
  name         = local.table_name
  billing_mode = "PROVISIONED"

  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  hash_key  = "pk"
  range_key = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  table_class                 = "STANDARD"
  deletion_protection_enabled = var.deletion_protection_enabled

  tags = {
    Environment = var.environment_tag
  }
}
