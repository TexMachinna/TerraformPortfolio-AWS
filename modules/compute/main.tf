terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }
  required_version = ">= 1.0.0, < 2.0.0"
}

resource "aws_launch_template" "this" {
  name_prefix            = "${var.environment_tag}_launch_template"
  image_id               = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
}

resource "aws_autoscaling_group" "this" {
  desired_capacity    = var.asg_desired_size
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  vpc_zone_identifier = [var.subnet_id]
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Environment"
    value               = var.environment_tag
    propagate_at_launch = true
  }
}
