output "netbird_instance_info" {
  description = "Information about the created NetBird instance."
  value       = module.netbird_instance.instance_info
}

output "netbird_dns_info" {
  description = "Information about the created DNS record."
  value       = module.netbird_dns_record.dns_record_info
}

output "netbird_url" {
  description = "The URL to access the NetBird dashboard."
  value       = "https://${var.subdomain_name}.${var.domain_name}"
}

output "netbird_credentials" {
  description = "Location of NetBird admin credentials."
  value       = "The NetBird admin credentials will be found inside the /home/linuxuser/netbird/setup.log file once the installation is completed."
}

output "ssh_connection" {
  description = "SSH connection command."
  value       = module.netbird_instance.instance_info.login
}