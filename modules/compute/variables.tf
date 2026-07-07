variable "environment_tag" {
  description = "Tag assigned to each resource, depending on their environment"
  type        = string
}

variable "instance_type" {
  description = "Type (size) of instance to be used"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet assigned to the compute resources"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group assigned to the compute resources"
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
