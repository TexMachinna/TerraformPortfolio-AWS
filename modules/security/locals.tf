locals {
  effective_ssh_cidr = (
    var.cidr_ipv4 != "" ? var.cidr_ipv4 : "${trimspace(data.http.my_ip.response_body)}/32"
  )
}