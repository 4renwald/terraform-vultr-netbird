locals {
  user_data = templatefile("${path.module}/templates/netbird_setup.sh.tmpl", {
    domain_name    = var.domain_name
    subdomain_name = var.subdomain_name
  })

  tcp_ports = toset([
    "80",
    "443",
    "33073",
    "10000",
    "33080"
  ])

  udp_ports = toset([
    "3478",
    "49152-65535",
  ])
}
