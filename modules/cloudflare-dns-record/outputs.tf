output "dns_record_id" {
  description = "The ID of the created DNS record."
  value       = cloudflare_dns_record.netbird_dns_record.id
}

output "dns_record_fqdn" {
  description = "The fully qualified domain name of the DNS record."
  value       = "${cloudflare_dns_record.netbird_dns_record.name}.${data.cloudflare_zone.dns_zone.name}"
}

output "dns_record_info" {
  description = "Complete information about the DNS record."
  value = {
    id       = cloudflare_dns_record.netbird_dns_record.id
    name     = cloudflare_dns_record.netbird_dns_record.name
    content  = cloudflare_dns_record.netbird_dns_record.content
    proxied  = cloudflare_dns_record.netbird_dns_record.proxied
    ttl      = cloudflare_dns_record.netbird_dns_record.ttl
    hostname = "${cloudflare_dns_record.netbird_dns_record.name}.${data.cloudflare_zone.dns_zone.name}"
  }
}