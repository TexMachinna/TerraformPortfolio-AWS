# Provider variables
variable "provider_region" {
  description = "Region where the resources will be deployed"
  type = string
}

# Network variables
variable "environment_tag" {
  description = "Tag assigned to each resource, depending on their environment"
  type        = string
}

variable "vpc_block" {
  description = "IP block assigned for the VPC (should be different from the rest of the environments)"
  type        = string
}

variable "public_subnet_cidr" {
  description = "IP block assigned for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "IP block assigned for the private subnet"
  type        = string
}

# Security variables
variable "cidr_ipv4" {
  description = "IPv4 blocks allowed to SSH the resources"
  type = string
  default = "10.0.0.0/16"
}

# Compute variables
variable "instance_type" {
  description = "Type (size) of instance to be used"
  type        = string
}
variable "asg_min_size" {
  description = "Minimum size for the ASG"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size for the ASG"
  type        = number
}

variable "asg_desired_size" {
  description = "Desired size for the ASG"
  type        = number
}
