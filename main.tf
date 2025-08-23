module "netbird_instance" {
  source = "./modules/vultr-instance"

  ssh_key_ids        = var.ssh_key_ids
  hostname           = var.hostname
  label              = var.label
  region             = var.region
  activation_email   = var.activation_email
  plan               = var.plan
  os_id              = var.os_id
  firewallgroup_name = var.firewallgroup_name
  ssh_allowed_ip     = var.ssh_allowed_ip
  tcp_ports          = local.tcp_ports
  udp_ports          = local.udp_ports
  user_data          = local.user_data
}

 module "netbird_dns_record" {
  source = "./modules/cloudflare-dns-record"

  domain_name        = var.domain_name
  subdomain_name     = var.subdomain_name
  dns_record_comment = var.dns_record_comment
  dns_record_ip      = module.netbird_instance.instance_info.instance_ip
 }