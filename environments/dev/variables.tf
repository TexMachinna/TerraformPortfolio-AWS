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
