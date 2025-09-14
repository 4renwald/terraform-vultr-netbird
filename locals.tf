locals {
  user_data = templatefile("${path.module}/templates/netbird_setup.sh.tmpl", {
    domain_name    = var.domain_name
    subdomain_name = var.subdomain_name
  })

  # NetBird default ports - configurable via variables
  default_tcp_ports = [
    "80",    # HTTP
    "443",   # HTTPS
    "33073", # NetBird Management API
    "10000", # NetBird Dashboard
    "33080"  # NetBird Signal
  ]

  default_udp_ports = [
    "3478",       # STUN/TURN server
    "49152-65535" # Dynamic port range for TURN relay
  ]

  tcp_ports = length(var.custom_tcp_ports) > 0 ? var.custom_tcp_ports : local.default_tcp_ports
  udp_ports = length(var.custom_udp_ports) > 0 ? var.custom_udp_ports : local.default_udp_ports

  # Common tags for all resources
  common_tags = merge(
    {
      Project     = "netbird"
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.additional_tags
  )
}
