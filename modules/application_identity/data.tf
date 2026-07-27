data "aws_iam_policy_document" "ec2_trust" {
  statement {
    sid     = "AllowEC2AssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "dynamodb_access" {
  statement {
    sid    = "AccessEnvironmentMessagesTable"
    effect = "Allow"

    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query"
    ]

    resources = [var.dynamodb_table_arn]
  }
}

resource "aws_iam_instance_profile" "this" {
  name = "${local.name_prefix}-applicaion-profile"
  role = aws_iam_role.this.name

  tags = {
    Environment = var.environment_tag
  }

  depends_on = [aws_iam_role_policy_attachment.dynamodb_access]
}
