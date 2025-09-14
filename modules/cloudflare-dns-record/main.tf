data "cloudflare_zone" "dns_zone" {
  filter = {
    name = var.domain_name
  }
}

resource "cloudflare_dns_record" "netbird_dns_record" {
  zone_id = data.cloudflare_zone.dns_zone.zone_id
  name    = var.subdomain_name
  ttl     = var.dns_record_ttl
  type    = "A"
  comment = var.dns_record_comment
  content = var.dns_record_ip
  proxied = var.dns_record_proxied
}