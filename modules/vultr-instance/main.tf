resource "vultr_instance" "instance" {
  plan                = var.plan
  region              = var.region
  os_id               = var.os_id
  label               = var.label
  hostname            = var.hostname
  activation_email    = var.activation_email
  ssh_key_ids         = var.ssh_key_ids
  user_scheme         = "limited"
  enable_ipv6         = var.enable_ipv6
  disable_public_ipv4 = false
  ddos_protection     = var.enable_ddos_protection
  backups             = var.enable_backups ? "enabled" : "disabled"
  firewall_group_id   = vultr_firewall_group.firewallgroup.id
  user_data           = var.user_data

  tags = [for k, v in var.common_tags : "${k}:${v}"]
}

resource "vultr_firewall_group" "firewallgroup" {
  description = var.firewallgroup_name
}

resource "vultr_firewall_rule" "firewallrule_tcp_v4" {
  for_each          = var.tcp_ports
  firewall_group_id = vultr_firewall_group.firewallgroup.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = each.value
  notes             = "allow tcp ${each.value}"
}

resource "vultr_firewall_rule" "firewallrule_udp_v4" {
  for_each          = var.udp_ports
  firewall_group_id = vultr_firewall_group.firewallgroup.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = each.value
  notes             = "allow udp ${each.value}"
}

resource "vultr_firewall_rule" "firewallrule_ssh" {
  firewall_group_id = vultr_firewall_group.firewallgroup.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = split("/", var.ssh_allowed_ip)[0]
  subnet_size       = length(split("/", var.ssh_allowed_ip)) > 1 ? tonumber(split("/", var.ssh_allowed_ip)[1]) : 32
  port              = "22"
  notes             = "Allow SSH access from ${var.ssh_allowed_ip}"
}
