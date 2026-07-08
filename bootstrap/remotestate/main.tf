terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  required_version = ">= 1.0.0, < 2.0.0"

  backend "s3" {
    key = "backend/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  s3_backend_bucket_name = "s3-backend-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket" "s3_backend" {
  bucket = local.s3_backend_bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Usage       = "Backend"
    Environment = "Bootstrap/Backend"
  }
}

resource "aws_s3_bucket_versioning" "backend_versioning" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_encryption" {
  bucket = aws_s3_bucket.s3_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.s3_backend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_lock_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
