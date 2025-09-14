variable "dns_record_comment" {
  type        = string
  description = "Comment for the DNS record."
}

variable "dns_record_ip" {
  type        = string
  description = "IP address used for the DNS record."
}

variable "domain_name" {
  type        = string
  description = "Domain name used for the DNS record."
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain used for the DNS record."
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