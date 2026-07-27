variable "environment" {
  description = "Environment name used in the generated Ansible inventory"
  type        = string
}

variable "public_ips" {
  description = "Public IP addresses of the web servers"
  type        = list(string)
}

variable "inventory_path" {
  description = "Destination path for the generated Ansible inventory"
  type        = string
}
