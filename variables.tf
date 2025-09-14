####################################
## vultr-instance variables
####################################

variable "vultr_api_key" {
  type        = string
  description = "API key used to deploy Vultr resources."
  sensitive   = true
}

variable "cloudflare_api_token" {
  type        = string
  description = "API key used to add Cloudflare DNS record."
  sensitive   = true
}

variable "ssh_key_ids" {
  type        = list(string)
  description = "A list of SSH key IDs to apply to the server on install (only valid for Linux/FreeBSD)."
}

variable "hostname" {
  type        = string
  description = "Hostname of the NetBird instance running in Vultr."
}

variable "label" {
  type        = string
  description = "Label to assign to the Vultr instance."
}

variable "region" {
  type        = string
  description = "Vultr region code where the instance will be deployed."
}

variable "activation_email" {
  type        = bool
  description = "Whether to send the Vultr activation email."
  default     = false
}

variable "plan" {
  type        = string
  description = "Vultr plan ID for the instance size."
  default     = "vc2-1c-2gb"
}

variable "os_id" {
  type        = number
  description = "Vultr OS ID for the instance."
  default     = 2571
}

variable "ssh_allowed_ip" {
  type        = string
  description = "IP address allowed to SSH into the instance."
}

variable "firewallgroup_name" {
  type        = string
  description = "Name of the firewall group linked to the instance."
}

####################################
## cloudflare-dns-record variables
####################################

variable "dns_record_comment" {
  type        = string
  description = "Comment for the DNS record."
}

variable "domain_name" {
  type        = string
  description = "Domain name used for the DNS record."
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain used for the DNS record."
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)."
  default     = "prod"
}

variable "custom_tcp_ports" {
  type        = list(string)
  description = "Custom TCP ports to open in firewall. If empty, uses NetBird defaults."
  default     = []
}

variable "custom_udp_ports" {
  type        = list(string)
  description = "Custom UDP ports to open in firewall. If empty, uses NetBird defaults."
  default     = []
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags to apply to all resources."
  default     = {}
}

variable "enable_backups" {
  type        = bool
  description = "Enable automatic backups for the Vultr instance."
  default     = false
}

variable "enable_ddos_protection" {
  type        = bool
  description = "Enable DDoS protection for the Vultr instance."
  default     = false
}

variable "enable_ipv6" {
  type        = bool
  description = "Enable IPv6 for the Vultr instance."
  default     = false
}

variable "dns_record_proxied" {
  type        = bool
  description = "Whether the DNS record should be proxied through Cloudflare."
  default     = true
}

variable "dns_record_ttl" {
  type        = number
  description = "TTL for the DNS record in seconds."
  default     = 1
}