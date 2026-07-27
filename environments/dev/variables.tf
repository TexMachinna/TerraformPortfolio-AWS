# Provider variables
variable "provider_region" {
  description = "Region where the resources will be deployed"
  type        = string
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
  type        = string
  default     = ""
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

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
}

# Monitoring variables

variable "cloudwatch_period" {
  description = "Period (intervals) for the CloudWatch Metric alarm"
  type        = number
}

variable "cloudwatch_eval_period" {
  description = "Periods over which data is being compared against the specified threshold"
  type        = number
}

variable "cloudwatch_threshold" {
  description = "CPU utilization threshold for the CloudWatch Metric alarm"
  type        = number
}

# Dyanmo DB variables

variable "project_name" {
  description = "Project name used to construct the DynamoDB Table"
  type        = string
}

variable "read_capacity" {
  description = "Provisioned read capacity units for the DynamoDB Table"
  type        = number
  default     = 1
}

variable "write_capacity" {
  description = "Provisioned write capacity units for the DynamoDB Table"
  type        = number
  default     = 1
}

variable "deletion_protection_enabled" {
  description = "Whether DynamoDB deletion is enabled" # Keep as 'disabled' so 'terraform destroy' can delete it
  type        = bool
  default     = false
}
