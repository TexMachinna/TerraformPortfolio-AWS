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
  name_prefix = "${var.project_name}-${var.environment_tag}"
}

resource "aws_iam_role" "this" {
  name               = "${local.name_prefix}-application-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_trust.json

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_iam_policy" "dynamodb_access" {
  name        = "${local.name_prefix}-dynamodb-access"
  description = "Allows portfolio EC2 instances to access their environment DynamoDB Table"
  policy      = data.aws_iam_policy_document.dynamodb_access.json

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_iam_role_policy_attachment" "dynamodb_access" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.dynamodb_access.arn
}
