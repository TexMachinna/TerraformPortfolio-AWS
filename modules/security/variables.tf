variable "environment_tag" {
  description = "Tag assigned to each resource, depending on their environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cidr_ipv4" {
  description = "IPv4 blocks allowed to SSH the resources"
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_http" {
  description = "CIDR permitted to access the web servers"
  type = string
  default = "0.0.0.0/0"
}