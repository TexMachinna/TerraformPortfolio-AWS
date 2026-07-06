terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }

  required_version = ">= 1.0.0, < 2.0.0"
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_block

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.this.id

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route.id
}
