resource "local_file" "inventory" {
  filename = var.inventory_path

  content = templatefile(
    "${path.module}/templates/hosts.ini.tftpl",
    {
      environment = var.environment
      public_ips  = sort(var.public_ips)
    }
  )
}
