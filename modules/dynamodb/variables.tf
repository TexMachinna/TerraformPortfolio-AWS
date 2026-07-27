variable "project_name" {
  description = "Project name used to construct the DynamoDB Table"
  type        = string
}

variable "environment_tag" {
  description = "Tag assigned to each resource, depending on their environment"
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
