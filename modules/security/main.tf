terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  required_version = ">= 1.0.0, < 2.0.0"
}

resource "aws_security_group" "this" {
  name        = "${var.environment_tag}-ec2-sg"
  description = "Network security group dedicated to EC2 instances"
  vpc_id      = var.vpc_id

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
